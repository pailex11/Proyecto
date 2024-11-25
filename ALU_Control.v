module Unidad_Control_ALU(
    input wire [1:0] alu_op,         
    input wire [2:0] funct3,         
    input wire [6:0] funct7,         
    output reg [3:0] alu_control     
);
    always @(*) begin
        case (alu_op)
            2'b00: begin
                alu_control = 4'b0010; 
            end
            2'b01: begin
                alu_control = 4'b0110;
            end
            2'b10: begin
                case (funct3)
                    3'b000: begin 
                        if (funct7 == 7'b0100000) 
                            alu_control = 4'b0110; 
                        else
                            alu_control = 4'b0010; 
                    end
                    3'b111: alu_control = 4'b0000; 
                    3'b110: alu_control = 4'b0001; 
                    3'b010: alu_control = 4'b0111; 
                    default: alu_control = 4'b1111; 
                endcase
            end
            default: alu_control = 4'b1111; 
        endcase
    end
endmodule

