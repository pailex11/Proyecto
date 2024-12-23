`timescale 1ns/1ns

module Top(
    input wire clk,
    input wire reset
);
    wire [31:0] pc_salida, pc_entrada, instruccion, signo_extendido, resultadoALU, dato_memoria;
    wire [31:0] dato_leido1, dato_leido2, dato_escritura, operandoALU2;
    wire [4:0] registro_escritura;
    wire [3:0] controlALU;
    wire reg_dst, salto, memoria_lectura, memoria_a_registro, alu_src, reg_escritura, memoria_escritura, cero;

    PC pc(.clk(clk),.reset(reset),.pc_in(pc_entrada),.pc_out(pc_salida));
        
    Intruccion_Memoria memoria_instrucciones(.direccion(pc_salida),.instruction(instruccion));

    Banco_Registros banco_registros(.regEscribir(reg_escritura),.A(instruccion[25:21]),.B(instruccion[20:16]),.C(registro_escritura),.WE(dato_escritura),.RE1(dato_leido1),.RE2(dato_leido2));

    UnidadControl control(.codigoOp(instruccion[31:26]),.RegDestino(reg_dst),.Salto(salto),.MemoriaLectura(memoria_lectura),.MemoriaARegistro(memoria_a_registro),.OperacionALU(controlALU),.MemoriaEscritura(memoria_escritura),.ALUSrc(alu_src),.RegistroEscritura(reg_escritura));

    MUX2_1 mux_alu_src(.sel(alu_src),.A(dato_leido2),.B(signo_extendido),.C(operandoALU2));

    ALU alu(.A(dato_leido1),.B(operandoALU2),.controlALU(controlALU),.resultadoALU(resultadoALU),.cero(cero));

    RAM memoria_datos(.Datoin(dato_leido2),.Dir(resultadoALU[4:0]),.WE(memoria_escritura),.RE(memoria_lectura),.Datoout(dato_memoria));

    MUX2_1 mux_memoria_a_registro(.sel(memoria_a_registro),.A(resultadoALU),.B(dato_memoria),.C(dato_escritura));

    MUX2_1 mux_reg_dst(.sel(reg_dst),.A(instruccion[20:16]),.B(instruccion[15:11]),.C(registro_escritura));

    MUX4_1 mux4_1(.sel(operacionALU_sel), .A(dato_leido1), .B(dato_leido2), .C(resultadoALU), .D(dato_memoria), .Y(mux4_1_Y));

    ADD suma_pc(.A(pc_salida),.B(32'd4),.Sum(pc_entrada));

    ALU_Control alu_control(.OperacionALU(operacionALU_sel), .funct(instruccion[5:0]), .controlALU(controlALU));


endmodule

