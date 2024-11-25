module Shift_Left_2(
    input [31:0] in,   // Entrada
    output [31:0] out  // Salida
);
    assign out = in << 2;
endmodule

