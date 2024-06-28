`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2024 16:58:36
// Design Name: 
// Module Name: mem_test_tb
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


module mem_test_tb(

    );
    
    reg Clk;
    reg [11:0] Addra,Addrb;
    reg [31:0] Dina,Dinb;
    wire [31:0] Douta,Doutb;
    reg Wea,Web;
    reg Ena,Enb;
    
    mem_test dut(Clk,Addra,Dina,Ena,Wea,Douta,Clk,Addrb,Dinb,Enb,Web,Doutb);
    
    initial
    begin
        Clk = 1'b0;
        Wea = 1'b0;
        Ena = 1'b1;
        Enb = 1'b1;
        Web = 1'b0;
        #5 Addra = 12'h000;
        Addrb = Addra + 1;
        #5 Clk = 1'b1;
        
        #5 Clk = 1'b0;
        
        
        
        repeat(15)
            #5 Clk = ~Clk;
        #10 $finish;
    end
    
    always @(negedge Clk)
    begin
        Addra = Addra + 2;
        Addrb = Addra + 1;
    end

endmodule
