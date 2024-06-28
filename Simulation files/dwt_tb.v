`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2024 16:47:05
// Design Name: 
// Module Name: dwt_tb
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


module dwt_tb();
    reg [31:0]y2n, y2n_1,y2na;
    reg clk,s2,s3,s4,s5,s6;
    reg [1:0] s1;
    wire [31:0]an,dn;
    
    dwt dut(y2n, y2n_1,y2na,clk,s1,s2,s3,s4,s5,s6,an,dn);
    
    initial
    begin
        clk = 1'b0;
        #4
        repeat (15)
            #5clk = ~clk;
        
    end
    
    initial
    begin
        
        //0
        y2n = 32'hbe147ae1;
        y2n_1 = 32'hbdf5c28f;
        y2na = 32'hbe147ae1;
        s1 = 2'b00;
        s2 = 1'b0;
        s3 = 1'b1;
        s4 = 1'b0;
        s5 = 1'b0;
        s6 = 1'b1;
        #10
        //1
        y2n = 32'hbe0a3d71;
        y2n_1 = 32'hbe147ae1;
        y2na = 32'hbe147ae1;
        s1 = 2'b00;
        s2 = 1'b0;
        s3 = 1'b1;
        s4 = 1'b0;
        s5 = 1'b0;
        s6 = 1'b1;
        
        #10
        //2
        y2n = 32'hbe147ae1;
        y2n_1 = 32'hbe147ae1;
        y2na = 32'hbe147ae1;
        s1 = 2'b01;
        s2 = 1'b1;
        s3 = 1'b0;
        s4 = 1'b1;
        s5 = 1'b1;
        s6 = 1'b0;
        //yha tk check kr liya h
        
        #10 //3
        y2n = 32'hbe19999a;
        y2n_1 = 32'hbe23d70a;
        y2na = 32'hbe147ae1;
        s1 = 2'b00;
        s2 = 1'b0;
        s3 = 1'b1;
        s4 = 1'b0;
        s5 = 1'b0;
        s6 = 1'b1;
        
        #10//4
        y2n = 32'hbe147ae1;
        y2n_1 = 32'hbe147ae1;
        y2na = 32'hbe0a3d71;
        s1 = 2'b10;
        s2 = 1'b1;
        s3 = 1'b0;
        s4 = 1'b1;
        s5 = 1'b1;
        s6 = 1'b0;
        
        #10//5
        y2n = 32'hbe1eb852;
        y2n_1 = 32'hbe23d70a;
        y2na = 32'hbe147ae1;
        s1 = 2'b00;
        s2 = 1'b0;
        s3 = 1'b1;
        s4 = 1'b0;
        s5 = 1'b0;
        s6 = 1'b1;
        
        #10//6
        y2n = 32'hbe147ae1;
        y2n_1 = 32'hbe147ae1;
        y2na = 32'hbe19999a;
        s1 = 2'b10;
        s2 = 1'b1;
        s3 = 1'b0;
        s4 = 1'b1;
        s5 = 1'b1;
        s6 = 1'b0;
    
        $monitor("y2n = %h, y2n+1 = %h, an = %h, dn = %h", y2n, y2n_1, an, dn);

        
        
        #10 $finish;
    
    end
endmodule
