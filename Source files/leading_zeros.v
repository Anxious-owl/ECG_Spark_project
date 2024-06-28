`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2024 16:01:12
// Design Name: 
// Module Name: leading_zeros
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
module leading_zeros(x,zero_count);
    input [23:0] x;
    output reg [5:0] zero_count;
    
    always @(*)
    begin
        casex(x)
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
        
    end
endmodule


