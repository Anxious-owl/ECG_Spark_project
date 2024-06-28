`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2024 16:20:02
// Design Name: 
// Module Name: leading_zeros_tb
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


module leading_zeros_tb();
    reg [23:0] x;
    wire [4:0] zero;
    
    leading_zeros dut(x,zero);
    

            
    initial
    begin
        x = 24'b111100101000110101010100;
        
        #5 x = 24'b000100101000110101010100;
        
        #5 x = 24'b000000101000110101010100;
        
        #5 x = 24'b000000110000000000000000;
        
        #5 x = 24'b000000000000011000000000;
        
        #5 x = 24'b000000000000000000010000;
        
        #5 x = 24'b000000000000000000000100;
        
        #5 x = 24'b000000000000000000000001;
        $monitor("x = %b, zeros = %b", x,zero);
        
        #5 $finish;
        
    end
endmodule
