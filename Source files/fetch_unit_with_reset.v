`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 08:36:47
// Design Name: 
// Module Name: fetch_unit_with_reset
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


module fetch_unit_with_reset(clk,switch,address,clk_out);
    input switch;
    input clk;
    output reg [11:0] address;
    output reg clk_out;
    reg wtf;
    
    reg [1:0] count;
    
    always @(switch)
        begin
            if (wtf)
                begin
                    count = 2'bXX;
                    clk_out = 1'b0;
                end
        end
    
    always @(negedge clk)
    begin
        case(count)
            2'b00:
            begin
                address = 12'h000;
                clk_out = 1'b0;
                count = count + 1;
            end
            2'b01:
            begin   
                wtf = 1'b1;
                clk_out = 2'd1;
                count = count + 1;
            end
            2'b10:
            begin
                clk_out = ~clk_out;
                address = address + 1;
                count = count + 1;
            end
            2'b11:
            begin
                count = count - 1;
                clk_out = ~clk_out;
            end
            default:
                begin
                    count = 2'b00;
                end
                
        endcase
    end
endmodule
