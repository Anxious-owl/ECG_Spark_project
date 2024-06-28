`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2024 19:10:20
// Design Name: 
// Module Name: switching_tb
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


module switching_tb();
    
    reg switch;
    reg [11:0] lc_addra,lc_addrb,fu_addra;
    reg [31:0] dt_an;
    reg lc_clk_c,fu_clk_out;
    
    wire [11:0] m1_addra,m1_addrb,m2_addra,m2_addrb;
    wire m1_clka,m1_clkb,m1_wea,m1_enb,m2_clka,m2_clkb,m2_wea,m2_enb;
    wire [31:0] m1_dina,m2_dina;
    
    switching_block dut(switch,lc_addra,lc_addrb,lc_clk_c,fu_addra,fu_clk_out,dt_an,
        m1_addra,m1_addrb,m1_clka,m1_clkb,m1_wea,m1_dina,m1_enb,
        m2_addra,m2_addrb,m2_clka,m2_clkb,m2_wea,m2_dina,m2_enb);
        
    initial
    begin
        switch = 1'b0;
        lc_addra = 12'h2ec;
        lc_addrb = 12'h001;
        fu_addra = 12'h031;
        
        dt_an = 32'haeb123bc;
        
        #20
        switch = 1'b1;
        
        
    end
    
    initial
    begin
        fu_clk_out = 1'b0;
        #11.6 fu_clk_out = 1'b1;
        forever
            #2 fu_clk_out = ~fu_clk_out; 
    end
    
    initial
    begin
        lc_clk_c = 1'b1;
        repeat(10)
            #4 lc_clk_c = ~lc_clk_c; 
        # 4$finish;
    end
    
    
endmodule
