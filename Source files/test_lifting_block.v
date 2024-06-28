`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 14:41:20
// Design Name: 
// Module Name: test_lifting_block
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


module test_lifting_block(clk,clk1,dn,d2n,d2n_1,ds,dc,drc,m2_clk_out);
    
    input clk;
    input clk1;
    output wire ds,dc,drc,m2_clk_out;
    
    output [31:0] dn,d2n,d2n_1;
    
    wire [31:0] y2n,y2n_1,y2na;
    wire [31:0] an;
    
    
    wire [11:0] m1_addra,m1_addrb,m2_addra,m2_addrb;
    wire m1_clka,m1_clkb,m1_wea,m1_enb,m2_clka,m2_clkb,m2_wea,m2_enb;
    wire [31:0] m1_douta,m1_doutb,m2_douta,m2_doutb;
    wire [31:0] m1_dina,m2_dina;
    wire [11:0]addra,addrb,m2_address;
    wire [1:0] s1;
    wire s2,s3,s4,s5,s6;
    wire clk_d;
    wire switch;
    wire clk_c;
    //wire m2_clk_out;
    
    wire [31:0]dt_an;
    
    address_unit au(clk,clk1,addra,addrb,s1,s2,s3,s4,s5,s6,m2_address,m2_clk_out,clk_d,switch,clk_c,ds,dc,drc);
    
    switching_block sw(switch,addra,addrb,clk_c,m2_address,m2_clk_out,dt_an,
        m1_addra,m1_addrb,m1_clka,m1_clkb,m1_wea,m1_dina,m1_enb,
        m2_addra,m2_addrb,m2_clka,m2_clkb,m2_wea,m2_dina,m2_enb);
    
    mem_test m1(m1_clka,m1_addra,m1_dina,1'b1,m1_wea,m1_douta,m1_clkb,m1_addrb,32'h00000000,m1_enb,1'b0,m1_doutb);
    
    write_mem m2(m2_clka,m2_addra,m2_dina,1'b1,m2_wea,m2_douta,m2_clkb,m2_addrb,32'h00000000,m2_enb,1'b0,m2_doutb);
    
    assign y2n = (switch == 1'b0) ? m1_douta : m2_douta;
    assign y2n_1 = (switch == 1'b0) ? m1_doutb : m2_doutb;
    
    dff d1(y2n,clk_c,y2na);
    
    dwt dt(y2n, y2n_1,y2na,clk_d,s1,s2,s3,s4,s5,s6,an,dn);
    
    assign dt_an = (ds == 1'b0) ? an : dn;
    assign d2n = (dc == 1'b0) ? 32'd0 : m1_douta;
    assign d2n_1 = (dc == 1'b0) ? 32'd0 : m1_doutb;
    
endmodule
