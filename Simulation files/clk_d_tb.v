`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 06:13:25
// Design Name: 
// Module Name: clk_d_tb
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


module clk_d_tb();
    reg clk;
    reg switch;
    wire clk_d;
    
    clk_d_blk dut (clk,switch,clk_d);
    
    initial
    begin
        
        clk = 1'b1;
        #1 clk = 1'b0;
        repeat(24)
            #2 clk = ~clk;
        #2 $finish;
    end
    
    initial
    begin
        switch = 1'b0;
        #28 switch = 1'b1;
    end
    
endmodule
