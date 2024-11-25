`timescale 1ns/1ns

module Banco_Registros(
    input regEscribir,              
    input [4:0] A,                  
    input [4:0] B,                 
    input [4:0] C,                 
    input [31:0] WE,                
    output [31:0] RE1,              
    output [31:0] RE2               
);
    reg [31:0] registros [31:0];

    assign RE1 = registros[A];
    assign RE2 = registros[B];

    always @* begin
        if (regEscribir)
            registros[C] = WE;
    end
endmodule

