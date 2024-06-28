`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 12:50:24
// Design Name: 
// Module Name: fb_au1_tb
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


module fb_au1_tb();
    reg clk;
    reg clk1;
    wire clk_d;
    wire switch;
    wire [11:0]addra,addrb,m2_address;
    wire [1:0] s1;
    wire s2,s3,s4,s5,s6;
    wire m2_clk_out;
    
    
    test_address_unit dut(clk,clk1,addra,addrb,s1,s2,s3,s4,s5,s6,m2_address,m2_clk_out,clk_d,switch);
    
    initial
    begin
        clk = 1'b1;
        repeat(6746)
            #4 clk = ~clk; 
        #4 $finish;
    end
    
    initial
    begin
        clk1 = 1'b1;
        #1clk1 = 1'b0;
        forever
            #2 clk1 = ~clk1; 
    end
    
    
endmodule
