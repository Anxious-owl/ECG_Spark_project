`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2024 16:39:21
// Design Name: 
// Module Name: address_unit
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


module address_unit(clk,clk1,addra,addrb,s1,s2,s3,s4,s5,s6,m2_address,m2_clk_out,clk_d,switch,clk_c,ds,dc,drc);
    input clk,clk1;
    output clk_d;
    output wire switch;
    output [11:0]addra,addrb,m2_address;
    output [1:0] s1;
    output s2,s3,s4,s5,s6;
    output m2_clk_out;
    output clk_c;
    output wire ds,dc,drc;
    
    
    wire [11:0]load;
    
    
    loading_mux_ds load_mux(switch,load,ds,dc);
    load_counter lc(load,clk,addra,addrb,clk_c,switch,dc,drc);
    clk_d_blk d_clk(clk1,switch,clk_d);
    control_with_reset cu(clk_c,switch,s1,s2,s3,s4,s5,s6);
    fetch_unit_with_reset fu(clk_d,switch,m2_address,m2_clk_out);
    
endmodule
