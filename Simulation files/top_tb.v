`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2024 15:09:05
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    reg clk;
    reg clk1;
    
    
    wire [31:0] dn,threshold,out_a,out_b;
    
    test_top dut (clk,clk1,dn,threshold,out_a,out_b);
    
    
    initial
    begin
        clk = 1'b1;
        repeat(7010)
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
