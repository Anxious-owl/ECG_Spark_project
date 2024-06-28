`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2024 15:16:17
// Design Name: 
// Module Name: dwt
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


module dwt(y2n, y2n_1,y2na,clk,s1,s2,s3,s4,s5,s6,an,dn);
    input [31:0] y2n,y2n_1,y2na;
    input clk,s2,s3,s4,s5,s6;
    input [1:0] s1;
    output [31:0] an,dn;
    
    parameter alpha1 = 32'hbfddb3d7;
    parameter alpha2 = 32'h3eddb3d7;
    parameter alpha3 = 32'hbd8930a3;
    parameter alpha4 = 32'h3ff746ea;
    parameter alpha5 = 32'h3f0483ee;
    
    wire [31:0] m1,m2,m3,m4,m5,m6,mul1,mul2,add1,add2,K1,K2,K3,K4,temp;
    
    mux4 MUX1(y2n,K3,K4,32'h11111111,s1,m1);
    mux2 MUX2(y2n_1,K2,s2,m2);
    mux2 MUX3(y2na,32'h00000000,s3,m3);
    mux2 MUX4(alpha1,alpha2,s4,m4);
    mux2 MUX5(32'h3f800000,alpha3,s5,m5);
    mux2 MUX6(alpha4,32'h3f800000,s6,m6);
    
    multiplier MUL1(m1,m4,mul1);
    multiplier MUL2(m2,m5,mul2);
    
    adder A1(mul1,mul2,temp);
    adder A2(temp,m3,add1);
    
    multiplier MUL3(add1,m6,K1);
    assign an = K1;
    dff D1(K1,clk,K2);
    dff D2(K2,clk,K3);
    dff D3(K3,clk,K4);
    
    
    
    adder A3(add1,K2,add2);
    multiplier MUL4(alpha5,add2,dn);
    
endmodule
