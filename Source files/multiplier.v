`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 16:33:30
// Design Name: 
// Module Name: multiplier
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


module multiplier(A,B,Res

    );
    input [31:0] A,B;
    output reg [31:0] Res;
    
    reg sign_a, sign_b, sign_res;
    reg [7:0] exp_a, exp_b, exp_res;
    reg [23:0] frac_a, frac_b;
    reg [47:0] frac_tmp;
    reg [7:0] exp_tmp;
    reg flag;
    
    always @(*)
    begin
        // Extract sign, exponent, and significand
        sign_a = A[31];
        exp_a = A[30:23];
        frac_a = {1'b1, A[22:0]};
        
        sign_b = B[31];
        exp_b = B[30:23];
        frac_b = {1'b1, B[22:0]};
        
        // Calculate the sign of the result
        sign_res = sign_a ^ sign_b;
        
        // Add exponents
        exp_tmp = exp_a + exp_b - 127;
        
        // Multiply significands
        frac_tmp = frac_a * frac_b;
        
        
        // Normalize the result
        if (frac_tmp[47]) begin
            flag = 1'b0;
            exp_tmp = exp_tmp + 1;
        end
        else
        begin
            flag = 1'b1;
            frac_tmp = frac_tmp << 1;
        end
        
        
        // Pack the result
        exp_res = exp_tmp;
        Res = {sign_res, exp_res, frac_tmp[46:24]};

    end
endmodule
