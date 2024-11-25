`timescale 1ns/1ns

module Testbench_Unidad_Control_ALU();
    reg [1:0] alu_op;         
    reg [2:0] funct3;        
    reg [6:0] funct7;        
    wire [3:0] alu_control;   

    reg [31:0] instruccion_memoria [0:31]; 
    integer i;

    Unidad_Control_ALU uut (
        .alu_op(alu_op),
        .funct3(funct3),
        .funct7(funct7),
        .alu_control(alu_control)
    );

    initial begin
        $dumpfile("onda.vcd"); 
        $dumpvars(0, Testbench_Unidad_Control_ALU);
    end

    initial begin
        // Leer archivo decodificado
        $readmemb("memoria_instrucciones.txt", instruccion_memoria);

        for (i = 0; i < 32; i = i + 1) begin
            {funct7, funct3} = instruccion_memoria[i][31:25];
            alu_op = instruccion_memoria[i][24:23];
            #10;
            $display("Instrucción %0d: Funct7=%b, Funct3=%b, ALUOp=%b -> Control=%b", 
                     i, funct7, funct3, alu_op, alu_control);
        end

        $finish;
    end
endmodule

