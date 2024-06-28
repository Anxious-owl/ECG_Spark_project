`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 17:04:43
// Design Name: 
// Module Name: preprocessing
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


module preprocessing(clk,clk_d,an,clk_out);
    input clk,clk_d;
    output [31:0] an;
    output clk_out;
    
    
    wire [31:0] dn;
    transform_block tf(clk,clk_d,an,dn);
    //Load counter ki value fix ni h
    address_unit_2 au2(clk_d,an);
endmodule
