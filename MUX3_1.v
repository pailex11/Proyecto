`timescale 1ns/1ns

module MUX3_1(
    input [1:0] sel,                
    input [31:0] A,                 
    input [31:0] B,                
    input [31:0] C,               
    output reg [31:0] Y             
);
    always @* begin
        case(sel)
            2'b00: Y = A;
            2'b01: Y = B;
            2'b10: Y = C;
            default: Y = 32'b0;
        endcase
    end
endmodule
