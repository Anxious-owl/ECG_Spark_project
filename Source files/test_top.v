`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2024 14:58:44
// Design Name: 
// Module Name: test_top
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


module test_top(clk,clk1,dn,threshold,out_a,out_b);
    input clk;
    input clk1;
    
    output wire [31:0] threshold,dn,out_a,out_b;
    
    wire m2_clk_out,ds,dc,drc;
    wire [31:0] d2n,d2n_1;
    
    
    test_lifting_block preprocessing(clk,clk1,dn,d2n,d2n_1,ds,dc,drc,m2_clk_out);
    max_calc qrs(m2_clk_out,dn,threshold,ds,dc);
    thresholding_unit th(clk,d2n,d2n_1,threshold,out_a,out_b,dc,drc);
endmodule
