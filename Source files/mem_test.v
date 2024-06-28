`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2024 16:46:00
// Design Name: 
// Module Name: mem_test
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


module mem_test(Clka,Addra,Dina,Ena,Wea,Douta,Clkb,Addrb,Dinb,Enb,Web,Doutb);
    input wire Clka,Clkb;
    input wire [11:0] Addra,Addrb;
    input wire [31:0] Dina,Dinb;
    output wire [31:0] Douta,Doutb;
    input wire Wea,Web;
    input wire Ena,Enb;

    

    // BRAM instantiation
    blk_mem_gen_1 bram_inst (
        .clka(Clka),
        .wea(Wea),
        .addra(Addra),
        .dina(Dina),
        .douta(Douta),
        .ena(Ena),
        .clkb(Clkb),
        .web(Web),
        .addrb(Addrb),
        .dinb(Dinb),
        .doutb(Doutb),
        .enb(Enb)
    );
endmodule
