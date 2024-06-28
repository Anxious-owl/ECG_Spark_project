`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 11:12:45
// Design Name: 
// Module Name: alt_load_counter_tb
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


module alt_load_counter_tb();
    reg [10:0] load;
    reg clk;
    
    wire switch;
    wire [11:0]addra,addrb;
    wire clk_c;
    
    alt_load_counter dut (load,clk,addra,addrb,clk_c,switch);
    
    initial
    begin
        clk = 1'b1;
        load = 11'd10;
        repeat(50)
            #2 clk = ~clk; 
        #2 $finish;
    end
    
endmodule
