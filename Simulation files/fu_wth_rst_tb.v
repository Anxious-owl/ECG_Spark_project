`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 08:37:45
// Design Name: 
// Module Name: fu_wth_rst_tb
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


module fu_wth_rst_tb();
    reg clk;
    reg switch;
    wire [11:0] address;
    wire clk_out;
    
    fetch_unit_with_reset dut (clk,switch,address,clk_out);
    
    initial
    begin
        clk = 1'b0; 
        #10repeat (45)
            #2 clk = ~clk; 
        #2 $finish;
    end
    
    initial
    begin
        switch = 1'b0;
        #46 switch = 1'b1;
    end
endmodule
