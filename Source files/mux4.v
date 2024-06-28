`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2024 15:18:29
// Design Name: 
// Module Name: mux4
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


module mux4(i1,i2,i3,i4,s,out);
    input [31:0] i1,i2,i3,i4;
    input [1:0]s;
    output reg [31:0] out;
    
    always @(*)
    begin
        case(s)
        2'b00 : out = i1;
        2'b01 : out = i2;
        2'b10 : out = i3;
        2'b11 : out = i4;
        endcase
    end
    
endmodule
