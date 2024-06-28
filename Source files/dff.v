module dff(data,clk,out);
    input [31:0] data;
    input clk;
    output reg [31:0] out;
    
    always @(posedge clk)
    begin
        out = data;
    end
    
endmodule
