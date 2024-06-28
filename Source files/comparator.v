`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 15:37:12
// Design Name: 
// Module Name: comparator
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


module comparator(a,b,gt,lt,eq);
    input [31:0] a;
    input [31:0] b;
    
    output reg gt,lt,eq;
    
    wire sign_a, sign_b;
    wire [7:0] exp_a, exp_b;
    wire [23:0] mant_a, mant_b;

    assign sign_a = a[31];
    assign sign_b = b[31];
    assign exp_a = a[30:23];
    assign exp_b = b[30:23];
    assign mant_a = {1'b1, a[22:0]};
    assign mant_b = {1'b1, b[22:0]};
    
    always @(*) 
        begin
            if (a == b) 
                begin
                    eq = 1;
                    gt = 0;
                    lt = 0;
                end
             else if (sign_a == sign_b)
                begin
                    if (exp_a > exp_b)
                    begin
                        gt = ~sign_a;
                        lt = sign_a;
                    end
                    
                    else if (exp_a < exp_b)
                    begin
                        gt = sign_a;
                        lt = ~sign_a;
                    end
                    
                    else
                        begin
                            if(mant_a > mant_b)
                              begin
                                gt = ~sign_a;
                                lt = sign_a;
                              end 
                            else
                                begin
                                    gt = sign_a;
                                    lt = ~sign_a;
                                end
                        end
                    eq = 1'b0;
                end
             else
             begin
                gt = sign_b;
                lt = sign_a;
                eq = 1'b0;
             end
             
    end
    
endmodule
