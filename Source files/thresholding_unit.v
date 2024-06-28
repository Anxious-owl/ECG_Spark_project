`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2024 15:23:22
// Design Name: 
// Module Name: thresholding_unit
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


module thresholding_unit(clk,a,b,thresh,out_a,out_b,dc,drc);
    input [31:0] a;
    input [31:0] b;
    input clk,drc,dc;
    input [31:0] thresh;
    
    output [31:0] out_a;
    output [31:0] out_b;
    
    reg [31:0]da;
    reg [31:0]db;
    wire [31:0] threshold;
    
    wire lt1,gt1,eq1;
    wire lt2,gt2,eq2;
    wire clk_in;
    
    assign clk_in = clk & dc & ~drc;
    multiplier m1(thresh,32'h3e3851ec,threshold);
    
    always @(posedge clk_in)
        begin
            da = {1'b0,a[30:0]};
            db = {1'b0,b[30:0]};
        end
    
    comparator c1(da,threshold,gt1,lt1,eq1);
    comparator c2(db,threshold,gt2,lt2,eq2);
    
    assign out_a = (gt1 == 1) ? da : 32'd0;
    assign out_b = (gt2 == 1) ? db : 32'd0;
    
endmodule
