`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 06:43:57
// Design Name: 
// Module Name: control_with_reset_tb
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


module control_with_reset_tb();
    
    reg switch;
    reg clk;
    wire [1:0] state;
    wire s2,s3,s4,s5,s6;
    
    control_with_reset dut (clk,switch,state,s2,s3,s4,s5,s6);
    
    
    initial
    begin
        
        clk = 1'b0;
        repeat (30)
            #5clk = ~clk;
        #10 $finish;
    end
    
    initial
    begin
        switch = 1'b0;
        #80 switch = 1'b1;
    end
endmodule
