`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2024 17:17:08
// Design Name: 
// Module Name: switching_block
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


module switching_block(switch,lc_addra,lc_addrb,lc_clk_c,fu_addra,fu_clk_out,dt_an,
        m1_addra,m1_addrb,m1_clka,m1_clkb,m1_wea,m1_dina,m1_enb,
        m2_addra,m2_addrb,m2_clka,m2_clkb,m2_wea,m2_dina,m2_enb);
    
    input switch;
    input [11:0] lc_addra,lc_addrb,fu_addra;
    input [31:0] dt_an;
    input lc_clk_c,fu_clk_out;
    
    output wire [11:0] m1_addra,m1_addrb,m2_addra,m2_addrb;
    output wire m1_clka,m1_clkb,m1_wea,m1_enb,m2_clka,m2_clkb,m2_wea,m2_enb;
    output wire [31:0] m1_dina,m2_dina;
    
    assign m1_addra = (switch == 1'b0) ? lc_addra : fu_addra;
    assign m1_addrb = (switch == 1'b0) ? lc_addrb : 12'h000;
    assign m1_clka = (switch == 1'b0) ? lc_clk_c : fu_clk_out;
    assign m1_clkb = m1_clka;
    assign m1_wea = (switch == 1'b0) ? 1'b0 : 1'b1;
    assign m1_enb = (switch == 1'b0) ? 1'b1 : 1'b0;
    assign m1_dina = (switch == 1'b0) ? 32'h00000000 : dt_an;
    
    assign m2_addra = (switch == 1'b1) ? lc_addra : fu_addra;
    assign m2_addrb = (switch == 1'b1) ? lc_addrb : 12'h000;
    assign m2_clka = (switch == 1'b1) ? lc_clk_c : fu_clk_out;
    assign m2_clkb = m2_clka;
    assign m2_wea = (switch == 1'b1) ? 1'b0 : 1'b1;
    assign m2_enb = (switch == 1'b1) ? 1'b1 : 1'b0;
    assign m2_dina = (switch == 1'b1) ? 32'h00000000 : dt_an;

    
    /*always @(switch)
    begin
        if(switch == 1'b0)
        begin
            m1_addra = lc_addra;
            m1_addrb = lc_addrb;
            m1_clka = lc_clk_c;
            m1_clkb = lc_clk_c;
            m1_wea = 1'b0;
            m1_enb = 1'b1;
            m1_dina = 32'h00000000;
            
            m2_addra = fu_addra;
            m2_addrb = 12'h000;
            m2_clka = fu_clk_out;
            m2_clkb = fu_clk_out;
            m2_wea = 1'b1;
            m2_enb = 1'b0;
            m2_dina = dt_an;
        end
        
        else
            m2_addra = lc_addra;
            m2_addrb = lc_addrb;
            m2_clka = lc_clk_c;
            m2_clkb = lc_clk_c;
            m2_wea = 1'b0;
            m2_enb = 1'b1;
            m2_dina = 32'h00000000;
            
            m1_addra = fu_addra;
            m1_addrb = 12'h000;
            m1_clka = fu_clk_out;
            m1_clkb = fu_clk_out;
            m1_wea = 1'b1;
            m1_enb = 1'b0;
            m1_dina = dt_an;
    end*/
    
endmodule
