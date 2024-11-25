`timescale 1ns/1ns

module Ext_Signo(
    input [15:0] entrada,
    output [31:0] salida
);
    assign salida = {{16{entrada[15]}}, entrada}; 
endmodule

