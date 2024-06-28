`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 11:44:10
// Design Name: 
// Module Name: loading_mux_ds
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


module loading_mux_ds(switch,load,ds,dc);
    input switch;
    output [11:0] load;
    output reg ds = 1'b0;
    output reg dc = 1'b0;
    
    parameter l1 = 12'd3592;
    parameter l2 = 12'd1792;
    parameter l3 = 12'd894;
    parameter l4 = 12'd444;
    parameter l5 = 12'd220;
    
    reg en;
    reg [1:0]state = 2'b00; 
    
    reg [11:0] mux_out;
    
    
    always@(posedge switch)
        begin
        state = state + 1;
        en = 1'b1;
        if(state == 2'b11)
            ds = 1'b1;
        end
    always@(negedge switch)
        begin
        if (en == 1'b1)
            state = state+1;
        if (ds  == 1'b1)
            dc = 1'b1;
        end
        
    always @(state)
    begin
        case(state)
        2'b00 : mux_out = l1;
        2'b01 : mux_out = l2;
        2'b10 : mux_out = l3;
        2'b11 : mux_out = l4;
        endcase
    end
     
    assign load = (dc == 1'b0) ? mux_out : l5;
endmodule 
