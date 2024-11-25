`timescale 1ns/1ns

module RAM (
    input wire [31:0] Datoin,      
    input wire [4:0] Dir,          
    input wire WE,                
    input wire RE,                 
    output reg [31:0] Datoout      
);
    reg [31:0] ram [0:63];

    always @* begin
        if (WE)
            ram[Dir] = Datoin;
        else if (RE)
            Datoout = ram[Dir];
    end
endmodule

