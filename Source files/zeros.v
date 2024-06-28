`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2024 16:13:13
// Design Name: 
// Module Name: zeros
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


module zeros(x,zero_count);
    input [3:0] x;
    output reg [2:0] zero_count;
    
    always @(*)
    begin
        casex(x)
            4'b1XXX : zero_count = 0;
            4'b01XX : zero_count = 1;
            4'b001X : zero_count = 2;
            4'b0001 : zero_count = 3;
            4'b0000 : zero_count = 4;
        endcase
        
    end
endmodule
