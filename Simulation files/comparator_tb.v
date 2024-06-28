`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 15:55:29
// Design Name: 
// Module Name: comparator_tb
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


module comparator_tb();
    reg [31:0] a;
    reg [31:0] b;
    wire gt;
    wire eq;
    wire lt;

    comparator dut (a,b,gt,lt,eq);

    initial begin
        // Test cases
        a = 32'h3f800000; // 1.0
        b = 32'h40000000; // 2.0
        #10;

        a = 32'h40400000; // 3.0
        b = 32'h40400000; // 3.0
        #10;

        a = 32'hbf800000; // -1.0
        b = 32'h40000000; // 2.0
        #10;
        
        a = 32'h429c0000; // -1.0
        b = 32'hc29bfae1; // 2.0
        #10;
        
        a = 32'hc29c0000; // -1.0
        b = 32'hc29bfae1; // 2.0
        #10;
        
        a = 32'h3aa137f4; // -1.0
        b = 32'h3aa32f45; // 2.0
        #10;
        
        a = 32'hbeae147b; // -1.0
        b = 32'hbeae147b; // 2.0
        #10;
        
        a = 32'h3eae147b; // -1.0
        b = 32'h3eae147b; // 2.0
        #10;
        
        a = 32'h3e1eb852; // -1.0
        b = 32'h3e19999a; // 2.0
        #10;
        
        a = 32'hbd0b4396; // -1.0
        b = 32'hbd23d70a; // 2.0
        #10;
        
        $finish;
    end
endmodule
