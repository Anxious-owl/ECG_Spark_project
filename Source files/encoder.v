`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2024 14:24:00
// Design Name: 
// Module Name: encoder
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


module encoder(switch,load);
    input switch;
    output reg [11:0] load;
    
    parameter l1 = 12'd3592;
    parameter l2 = 12'd1792;
    parameter l3 = 12'd894;
    parameter l4 = 12'd444;
    
    reg en;
    reg [1:0]state = 2'b00; 
    always@(posedge switch)
        begin
        state = state + 1;
        en = 1'b1;
        end
    always@(negedge switch)
        begin
        if (en == 1'b1)
            state = state+1;
        end
    always @(state)
    begin
        case(state)
        2'b00 : load = l1;
        2'b01 : load = l2;
        2'b10 : load = l3;
        2'b11 : load = l4;
        endcase
    end
    
endmodule 
