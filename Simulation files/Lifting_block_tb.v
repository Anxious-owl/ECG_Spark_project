`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 15:49:20
// Design Name: 
// Module Name: Lifting_block_tb
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


module Lifting_block_tb();
    reg clk;
    reg clk1;
    reg read_clk = 1'b0;
    
    wire [31:0] y2n,y2n_1,y2na,an,dn;
    
    integer file;
    integer count = 0;
    
    Lifting_block dut(clk,clk1,y2n,y2n_1,y2na,an,dn);
    
    initial
    begin
        clk = 1'b1;
        repeat(6950)
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
    
    initial 
    begin
        file = $fopen("d4.txt", "w");
        #25201 read_clk = 1'b1;
        repeat(500)
            #4 read_clk = ~read_clk;
    end
    
    always @(posedge read_clk)
    begin
        $fwrite(file, "%b\n", dn);
        count = count+1;
    end
    
endmodule
