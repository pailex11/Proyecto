module ID_EX(
    input wire clk,
    input wire reinicio,
    input wire [31:0] pc_entrada,             
    input wire [31:0] registro1_entrada,       
    input wire [31:0] registro2_entrada,       
    input wire [31:0] extension_signo_entrada, 
    input wire [4:0] registro_destino_entrada, 
    output reg [31:0] pc_salida,
    output reg [31:0] registro1_salida,
    output reg [31:0] registro2_salida,
    output reg [31:0] extension_signo_salida,
    output reg [4:0] registro_destino_salida
);
    always @(posedge clk or posedge reinicio) begin
        if (reinicio) begin
            pc_salida <= 0;
            registro1_salida <= 0;
            registro2_salida <= 0;
            extension_signo_salida <= 0;
            registro_destino_salida <= 0;
        end else begin
            pc_salida <= pc_entrada;
            registro1_salida <= registro1_entrada;
            registro2_salida <= registro2_entrada;
            extension_signo_salida <= extension_signo_entrada;
            registro_destino_salida <= registro_destino_entrada;
        end
    end
endmodule

