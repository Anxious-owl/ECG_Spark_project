`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 17:20:25
// Design Name: 
// Module Name: preprocessing_tb
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


module preprocessing_tb();
    reg clk,clk_d;
    wire [31:0] an;
    wire clk_out;
    
    preprocessing dut (clk,clk_d,an,clk_out); 
    
    integer file;
    
    initial
    begin
        file = $fopen("output.txt", "w");
        clk = 1'b1;
        repeat(15)
            #4 clk = ~clk; 
        #4 $fclose(file);
        $finish;
    end
    
    always @(posedge clk_out)
    begin
        $fwrite(file, "%b\n", dn);
    end
    
    initial
    begin
        clk_d = 1'b0;
        #11.6 clk_d = 1'b1;
        forever
            #2 clk_d = ~clk_d; 
    end
    
     
endmodule
