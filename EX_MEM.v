module EX_MEM(
    input wire clk,
    input wire reinicio,
    input wire [31:0] pc_entrada,             
    input wire [31:0] resultado_alu_entrada, 
    input wire [31:0] dato_mem_entrada,     
    input wire [4:0] registro_destino_entrada, 
    output reg [31:0] pc_salida,
    output reg [31:0] resultado_alu_salida,
    output reg [31:0] dato_mem_salida,
    output reg [4:0] registro_destino_salida
);
    always @(posedge clk or posedge reinicio) begin
        if (reinicio) begin
            pc_salida <= 0;
            resultado_alu_salida <= 0;
            dato_mem_salida <= 0;
            registro_destino_salida <= 0;
        end else begin
            pc_salida <= pc_entrada;
            resultado_alu_salida <= resultado_alu_entrada;
            dato_mem_salida <= dato_mem_entrada;
            registro_destino_salida <= registro_destino_entrada;
        end
    end
endmodule

