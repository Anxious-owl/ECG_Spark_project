`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2024 21:50:32
// Design Name: 
// Module Name: load_ctr_tb
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


module load_ctr_tb();

    reg [11:0] load;
    reg clk;
    reg dc;
    
    wire drc;
    wire switch;
    wire [11:0]addra,addrb;
    wire clk_c;
    
    load_counter dut (load,clk,addra,addrb,clk_c,switch,dc,drc);
    
    initial
    begin
        clk = 1'b1;
        load = 12'd10;
        repeat(80)
            #2 clk = ~clk; 
        #2 $finish;
    end
    initial
    begin
        #128 dc = 1'b1;
    end
endmodule
