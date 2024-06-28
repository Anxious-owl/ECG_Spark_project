`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 11:02:18
// Design Name: 
// Module Name: alt_load_counter
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


module alt_load_counter(load,clk,addra,addrb,clk_c,switch);
    input [11:0] load;
    input clk;
    
    output reg switch = 1'b0;
    output reg [11:0]addra,addrb;
    output wire clk_c; 
    
    reg enable = 1'b0;
    reg [1:0] count = 2'b00;
    assign clk_c = ~clk;
    always @(posedge clk)
        begin
            if(addra < load)
                addra = addra + 2;
            else
                begin
                    if (addra >= load)
                        begin
                            addra = 12'h0000;
                            enable = 1'b1;
                        end
                    else
                        addra = 12'h0000;
                end
            addrb = addra + 1;
            
        end
        
    always @(posedge clk)
    begin
        if (enable == 1'b1)
            begin
                if (count == 2'b10)
                begin
                    addra = 12'h0000;
                    addrb = 12'h001;
                    switch = ~switch;
                    enable = 1'b0;
                    count = 1'b0;
                end
                
                else
                    count = count + 1;
            end
            
    end
endmodule