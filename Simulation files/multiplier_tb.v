`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 16:45:30
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb(

    );
    reg [31:0] a;
    reg [31:0] b;

    // Outputs
    wire [31:0] product;

    // Instantiate the Unit Under Test (UUT)
    multiplier uut (a,b,product);


    initial begin

        $monitor("a = %h, b = %h, result = %h", a, b, product);
        a = 32'h42fa4000; // 1.0
        b = 32'h41410000; // 1.
        #10;
        a = 32'h41000000; // 1.0
        b = 32'h41000000; // 1.0
        #10;
     
        a = 32'h40490FDB; // 1.0
        b = 32'hC02DF854; // 1.0

        #10;
        
        a = 32'h3E200000; // 1.0
        b = 32'hBF000000; // 1.0

        #10;
        
        a = 32'h3F800000; // 1.0
        b = 32'hC02DF854; // 1.0

        #10;
        
        a = 32'h41000000; // 1.0
        b = 32'h00000000; // 1.0

        #10;
        
        a = 32'hc20e999a; // 1.0
        b = 32'hc2b90000; // 1.0

        #10;
        
        $finish;
    end
endmodule
