`timescale 1ns/1ns

module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] controlALU,
    output reg [31:0] resultadoALU,
    output cero
);
    assign cero = (resultadoALU == 0); 

    always @(*) begin
        case (controlALU)
            4'b0010: resultadoALU = A + B;          
            4'b0110: resultadoALU = A - B;         
            4'b0000: resultadoALU = A & B;          
            4'b0001: resultadoALU = A | B;         
            4'b0011: resultadoALU = A ^ B;         
            4'b1100: resultadoALU = ~(A | B);      
            4'b0111: resultadoALU = (A < B) ? 1 : 0; 
            default: resultadoALU = 0;
        endcase
    end
endmodule

