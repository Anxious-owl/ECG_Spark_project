`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2024 19:50:58
// Design Name: 
// Module Name: new_control
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


module new_control(clk,state,s2,s3,s4,s5,s6);
    input clk;
    output reg [1:0] state;
    output reg s2,s3,s4,s5,s6;
    
    reg [1:0] count;
    reg toggle = 1'b0;
    reg enable = 1'b0;
    
    
    
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
                    
                end
                2'b11:
                begin
                    ;
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
