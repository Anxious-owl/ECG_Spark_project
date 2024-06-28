`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2024 16:13:10
// Design Name: 
// Module Name: write_mem_tb
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


module write_mem_tb();
    
    reg Clk;
    reg [11:0] Addra,Addrb;
    reg [31:0] Dina,Dinb;
    wire [31:0] Douta,Doutb;
    reg Wea,Web;
    reg Ena,Enb;
    
    write_mem dut(Clk,Addra,Dina,Ena,Wea,Douta,Clk,Addrb,Dinb,Enb,Web,Doutb);
    
    initial
    begin
        Clk = 1'b0;
        repeat(15)
            #4 Clk = ~Clk;
        #4 $finish;
    end
    
    initial
    begin
        Ena = 1'b1;
        Enb = 1'b0;
        Addra = 12'd0;
        Dina = 32'h41400000; //12
        Wea = 1'b1;
        
        #10
        Addra = 12'd1;
        Dina = 32'hbee9d495; // -0.4567
        
        #7
        Addra = 12'd2;
        Dina = 32'h3e6c8b44; // .231
        
        #9
        Addra = 12'd3;
        Dina = 32'h42c80000; // 100
        
        #6
        Enb = 1'b1;
        Web = 1'b0;
        Wea = 1'b0;
        Addra = 12'd0;
        Addrb = 12'd1;
        
        #10
        Addra = 12'd2;
        Addrb = 12'd3;
    end
endmodule
