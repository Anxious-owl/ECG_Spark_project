`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2024 22:26:18
// Design Name: 
// Module Name: address_unit_tb
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


module address_unit_tb();
    reg clk;
    reg clk1;
    wire clk_d;
    wire switch;
    wire [11:0]addra,addrb,m2_address;
    wire [1:0] s1;
    wire s2,s3,s4,s5,s6;
    wire m2_clk_out;
    wire clk_c,dc,ds,drc;
    
    address_unit dut(clk,clk1,addra,addrb,s1,s2,s3,s4,s5,s6,m2_address,m2_clk_out,clk_d,switch,clk_c,ds,dc,drc);
    
    
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
