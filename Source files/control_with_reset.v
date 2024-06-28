`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2024 06:40:04
// Design Name: 
// Module Name: control_with_reset
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


module control_with_reset(clk,switch,state,s2,s3,s4,s5,s6);
    input clk;
    input switch;
    output reg [1:0] state;
    output reg s2,s3,s4,s5,s6;
    
    reg [1:0] count;
    reg toggle = 1'b0;
    reg enable = 1'b0;
    reg enable_switch;
    
    always @(switch)
    begin
        if (enable_switch == 1'b1)
        begin
            count = 2'b00;
            toggle = 1'b0;
            enable = 1'b0;
        end
        else
            ;
    end
    
    always @(negedge clk) 
        begin
            case(count)
                2'b00:
                begin
                    state = 2'b00;
                    {s2,s4,s5} = 3'b000;
                    {s3,s6} = 3'b11;
                    count = count + 1;
                    
                end
                2'b01:
                    begin
                    state = 2'b01;
                    {s2,s4,s5} = 3'b111;
                    {s3,s6} = 3'b00;
                    count = count + 1;
                    enable = 1'b1;
                end
                
                2'b10:
                begin
                    state = 2'b10;
                    {s2,s4,s5} = 3'b111;
                    {s3,s6} = 3'b00;
                    enable_switch = 1'b1;
                    
                end
                2'b11:
                begin
                    count = 2'b00;
                end
                default: count = 2'b00;
            endcase
            
        end
        
        always @(posedge clk)
        begin
            if (enable == 1'b1)
            begin
                state = 2'b00;
                {s2,s4,s5} = 3'b000;
                {s3,s6} = 3'b11;
                
            end
        end
endmodule
