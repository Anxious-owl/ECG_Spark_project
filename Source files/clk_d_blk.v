`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 06:01:22
// Design Name: 
// Module Name: clk_d_blk
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


module clk_d_blk(clk,switch,clk_d);
    input clk;
    input switch;
    output wire clk_d;
    reg enable = 1'b0;
    
    reg [1:0] count = 2'b00;
    always @(negedge clk)
        begin
            case(count)
                2'b00: count = count + 1;

                2'b01: count = count + 1;
                
                2'b10: enable = 1'b1;
              
                2'b11: ;
                
                default: ;
             endcase
        end
    always@(switch)
        begin
            enable = 1'b0;
            count = 2'b00;
        end
    
    assign clk_d = (enable == 1'b1) ? clk : 1'b0;
endmodule
