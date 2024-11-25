`timescale 1ns/1ns

module Desp_Izq_2(
    input [31:0] entrada,
    output [31:0] salida
);
    assign salida = entrada << 2; 
endmodule

