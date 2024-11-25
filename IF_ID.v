module IF_ID(
    input wire clk,
    input wire reinicio,
    input wire [31:0] instruccion_entrada,  
    input wire [31:0] pc_entrada,          
    output reg [31:0] instruccion_salida,  
    output reg [31:0] pc_salida            
);
    always @(posedge clk or posedge reinicio) begin
        if (reinicio) begin
            instruccion_salida <= 0;
            pc_salida <= 0;
        end else begin
            instruccion_salida <= instruccion_entrada;
            pc_salida <= pc_entrada;
        end
    end
endmodule

