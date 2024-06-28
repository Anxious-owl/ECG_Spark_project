`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 15:03:16
// Design Name: 
// Module Name: fetch_unit_tb
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


module fetch_unit_tb( );
    reg clk;
    wire [11:0] address;
    wire clk_out;
    
    fetch_unit dut(clk,address,clk_out);
    
    initial
    begin
        clk = 1'b0; 
        #10repeat (15)
            #2 clk = ~clk; 
        #2 $finish;
    end
endmodule
