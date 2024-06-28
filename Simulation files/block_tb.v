`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 10:46:46
// Design Name: 
// Module Name: block_tb
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


module block_tb();
    reg clk;
    reg clk1;
    
    wire [31:0] dn,d2n,d2n_1;
    wire ds,dc,drc,m2_clk_out;
    
    test_lifting_block dut (clk,clk1,dn,d2n,d2n_1,ds,dc,drc,m2_clk_out);
    
    
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
