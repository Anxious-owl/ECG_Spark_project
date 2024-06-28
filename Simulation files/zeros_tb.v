`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2024 16:30:30
// Design Name: 
// Module Name: zeros_tb
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


module zeros_tb();
    reg [3:0] x;
    wire [2:0] zero;
    
    
    leading_zeros dut(x,zero);
    

            
    initial
    begin
        x = 4'b0000;
        
        #5 x = 4'b0001;
        
        #5 x = 4'b0010;
        
        #5 x = 4'b0011;
        
        #5 x = 4'b0100;
        
        #5 x = 4'b0101;
        
        #5 x = 4'b0110;
        
        #5 x = 4'b0111;
        
        #5 x = 4'b1000;
        
        #5 x = 4'b1001;
        
        #5 x = 4'b1010;
        
        #5 x = 4'b1011;
        
        #5 x = 4'b1100;
        
        #5 x = 4'b1101;
        
        #5 x = 4'b1110;
        
        #5 x = 4'b1111;
        
        $monitor("x = %b, zeros = %b", x,zero);
        
        #5 $finish;
        
    end
endmodule