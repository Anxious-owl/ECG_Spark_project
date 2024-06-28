`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 11:16:57
// Design Name: 
// Module Name: alternative adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder(A,B,Res);

input [31:0] A,B;
output reg [31:0] Res;

reg sign_a,sign_b,sign_res;
reg [7:0] exp_a,exp_b,exp_res;
reg [23:0] frac_a,frac_b,frac_res;
reg [24:0] frac_temp;
reg [7:0] exp_diff;
reg [23:0] test;
reg [5:0] zero_count;

always @(*)
begin
    //Unpacking A
    sign_a = A[31];
    exp_a = A[30:23];
    frac_a = {1'b1,A[22:0]};
    
    //Unpacking B
    sign_b = B[31];
    exp_b = B[30:23];
    frac_b = {1'b1,B[22:0]};
    
 
    
    //Exponent Difference
    if (exp_a > exp_b)
    begin
        exp_diff = exp_a - exp_b;
        frac_b = frac_b >> exp_diff;
        exp_res = exp_a;
    end
    else
    begin
        exp_diff = exp_b - exp_a;
        frac_a = frac_a >> exp_diff;
        exp_res = exp_b;
    end
    
    //Significant calculation
    if (sign_a == sign_b)
    begin
        frac_temp = frac_a + frac_b;
        sign_res = sign_a;
    end
    else
    begin
        if (frac_a > frac_b)
        begin
            frac_temp <= frac_a - frac_b;
            sign_res <= sign_a;
        end
        else
        begin
            frac_temp = frac_b - frac_a;
            sign_res = sign_b;
        end
    end
    casex(frac_temp[23:0])
            24'b1XXXXXXXXXXXXXXXXXXXXXXX: zero_count = 0;
            24'b01XXXXXXXXXXXXXXXXXXXXXX: zero_count = 1;
            24'b001XXXXXXXXXXXXXXXXXXXXX: zero_count = 2;
            24'b0001XXXXXXXXXXXXXXXXXXXX: zero_count = 3;
            24'b00001XXXXXXXXXXXXXXXXXXX: zero_count = 4;
            24'b000001XXXXXXXXXXXXXXXXXX: zero_count = 5;
            24'b0000001XXXXXXXXXXXXXXXXX: zero_count = 6;
            24'b00000001XXXXXXXXXXXXXXXX: zero_count = 7;
            24'b000000001XXXXXXXXXXXXXXX: zero_count = 8;
            24'b0000000001XXXXXXXXXXXXXX: zero_count = 9;
            24'b00000000001XXXXXXXXXXXXX: zero_count = 10;
            24'b000000000001XXXXXXXXXXXX: zero_count = 11;
            24'b0000000000001XXXXXXXXXXX: zero_count = 12;
            24'b00000000000001XXXXXXXXXX: zero_count = 13;
            24'b000000000000001XXXXXXXXX: zero_count = 14;
            24'b0000000000000001XXXXXXXX: zero_count = 15;
            24'b00000000000000001XXXXXXX: zero_count = 16;
            24'b000000000000000001XXXXXX: zero_count = 17;
            24'b0000000000000000001XXXXX: zero_count = 18;
            24'b00000000000000000001XXXX: zero_count = 19;
            24'b000000000000000000001XXX: zero_count = 20;
            24'b0000000000000000000001XX: zero_count = 21;
            24'b00000000000000000000001X: zero_count = 22;
            24'b000000000000000000000001: zero_count = 23;
            24'b000000000000000000000000: zero_count = 24;
    endcase
   
   
    
    //Renormalising
    if(frac_temp[24])
    begin
        frac_res = frac_temp[24:1];
        exp_res = exp_res + 1;
    end
    else
        begin
        frac_res = frac_temp[23:0];
        
        if (frac_res != 0)
            begin
                test = frac_res;
                frac_res = frac_res << zero_count;
                exp_res = exp_res - zero_count;
            end
        else
        begin
            sign_res = 0;
            exp_res = 8'h00;
            frac_res = 24'h000000;
        end
        end
       
    
    Res = {sign_res,exp_res,frac_res[22:0]};
end
endmodule
