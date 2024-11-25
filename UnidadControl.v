module Unidad_Control(
    input wire [6:0] opcode,        
    output reg alu_op,            
    output reg mem_lectura,       
    output reg mem_escritura,      
    output reg alu_fuente,         
    output reg reg_escritura,      
    output reg pc_fuente,          
    output reg branch              
);
    always @(*) begin
        alu_op = 0;
        mem_lectura = 0;
        mem_escritura = 0;
        alu_fuente = 0;
        reg_escritura = 0;
        pc_fuente = 0;
        branch = 0;

        case (opcode)
            7'b0110011: begin // R-Type
                alu_op = 2'b10;         
                alu_fuente = 0;         
                reg_escritura = 1;       
            end
            7'b0000011: begin // LW (Load Word)
                alu_op = 2'b00;          
                alu_fuente = 1;          
                mem_lectura = 1;        
                reg_escritura = 1;      
            end
            7'b0100011: begin // SW (Store Word)
                alu_op = 2'b00;         
                alu_fuente = 1;          
                mem_escritura = 1;       
            end
            7'b1100011: begin 
                alu_op = 2'b01;         
                branch = 1;              
                pc_fuente = 1;           
            end
            default: begin
            end
        endcase
    end
endmodule

