`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2024 13:15:36
// Design Name: 
// Module Name: control_tb
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


module control_tb();

    reg clk;
    wire [1:0] state;
    
    new_control dut(clk,state);
    
    
    initial
    begin
        clk = 1'b0;
        repeat (15)
            #5clk = ~clk;
        #10 $finish;
    end
endmodule
