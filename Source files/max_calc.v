`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 15:22:32
// Design Name: 
// Module Name: max_calc
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


module max_calc(clk,dn,threshold,ds,dc);
    input clk;
    input ds,dc;
    input [31:0] dn;
    output [31:0] threshold;
    
    reg [31:0]A = 32'd0;
    reg [31:0]B = 32'd0;
    wire clk_in,lt,gt,eq;
    
    comparator c1 (A,B,gt,lt,eq);
    assign clk_in = ds & clk & ~dc;
    always @(posedge clk_in)
        begin
            if (gt == 1'b1)
                B = A;
            A = {1'b0, dn[30:0]};
        end
    assign threshold = B;
endmodule
