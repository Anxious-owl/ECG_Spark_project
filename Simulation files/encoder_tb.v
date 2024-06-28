`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2024 14:47:01
// Design Name: 
// Module Name: encoder_tb
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


module encoder_tb();
    
    reg switch;
    wire [11:0] load;
    wire ds;
    wire dc;
    
    loading_mux_ds dut(switch,load,ds,dc);
    initial
    begin
        switch = 1'b0;
        #30 switch = 1'b1;
        #30 switch = 1'b0;
        #30 switch = 1'b1;
        #30 switch = 1'b0;
        #30 switch = 1'b1;
        #2 $finish;
    end
endmodule
