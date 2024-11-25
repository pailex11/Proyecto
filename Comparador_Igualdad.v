module Comparador_Igualdad(
    input [31:0] A, 
    input [31:0] B, 
    output reg igual 
);
    always @(*) begin
        igual = (A == B);
    end
endmodule

