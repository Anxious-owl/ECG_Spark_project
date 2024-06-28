`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 14:45:50
// Design Name: 
// Module Name: fetch_unit
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


module fetch_unit(clk,address,clk_out);
    input clk;
    output reg [11:0] address;
    output reg clk_out;
    
    reg [1:0] count;
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
                clk_out = 1'b1;
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
