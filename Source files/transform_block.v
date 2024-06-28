`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 10:05:25
// Design Name: 
// Module Name: transform_block
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


module transform_block(clk,clk_d,an,dn);
    input clk,clk_d;
    output [31:0] an,dn;
    
    wire [31:0]y2n,y2n_1,y2na;
    wire [1:0] s1;
    wire s2,s3,s4,s5,s6;
    
    
    //address_unit au1(clk,y2n,y2n_1,y2na,s1,s2,s3,s4,s5,s6);
    dwt dt(y2n, y2n_1,y2na,clk_d,s1,s2,s3,s4,s5,s6,an,dn);
endmodule
