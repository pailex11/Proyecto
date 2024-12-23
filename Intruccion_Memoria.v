`timescale 1ns/1ns

module Intruccion_Memoria(
    input [31:0] direccion,
    output reg [31:0] instruction
);
    reg [31:0] memoria [0:63];

    initial begin
        memoria[0] = 32'h00000000;
    end

    always @(*) begin
        instruction = memoria[direccion[31:2]];
    end
endmodule
