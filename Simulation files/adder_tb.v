`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2024 14:53:11
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();
    reg [31:0] a,b;
    wire [31:0] result;
    
    adder dut(.A(a),.B(b),.Res(result));
    

    initial
    begin
    
        a = 32'h41200000; // 1.0
        b = 32'h41700000; // 1.0
        
        $monitor("a = %h, b = %h, result = %h", a, b, result);

        #10 a = 32'hc2500000; // 10.0
        b = 32'h41700000; // 15.0

        #10 a = 32'h399d4952; // 1.0
        b = 32'h41700000; // 1.0
        
        #10 a = 32'hc1758814; // 1.0
        b = 32'h41758922; // 1.0
        
        #10 a = 32'h00000000; // 1.0
        b = 32'h80000000; // 1.0
        
        #10 a = 32'h422c20df; // 1.0
        b = 32'h404997f6;
        

        
        /*#10 a = 32'h41200000; // 1.0
        b = 32'h41700000; // 1.0
        
        #10 a = 32'h41200000; // 1.0
        b = 32'h41700000; // 1.0
        a = 16'b1100000000000000; // -2.0
        b = 16'b0011110000000000; // 1.0
        #10 display_result(a, b, result);

        a = 16'b0100000100000000; // 3.0
        b = 16'b1100000100000000; // -3.0
        #10 display_result(a, b, result);

        a = 16'b0111100000000000; // 65504.0 (max positive half precision)
        b = 16'b0011100000000000; // 0.5
        #10 display_result(a, b, result);

        a = 16'b0000000000000000; // 0.0
        b = 16'b0011110000000000; // 1.0
        #10 display_result(a, b, result);

        a = 16'b0000000000000000; // 0.0
        b = 16'b1000000000000000; // -0.0
        #10 display_result(a, b, result);

        a = 16'b0111100000000000; // max positive half precision (65504.0)
        b = 16'b1111100000000000; // max negative half precision (-65504.0)
        #10 display_result(a, b, result);

        // Add more test cases as needed*/

        #10 $finish;
    
    end
endmodule
