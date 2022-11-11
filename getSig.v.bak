module getSig(opcode, ALUop, R, addi, lw, sw, R_add, R_sub, R_and, R_or, R_sll, R_sra);
    input [4:0]opcode, ALUop;
    wire R;
    output R, addi, lw, sw, R_add, R_sub, R_and, R_or, R_sll, R_sra;

    assign R = (~opcode[4])&(~opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]);//00000
    assign addi = (~opcode[4])&(~opcode[3])&(opcode[2])&(~opcode[1])&(opcode[0]);//00101
    assign lw = (~opcode[4])&(opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]);//01000
    assign sw = (~opcode[4])&(~opcode[3])&(opcode[2])&(opcode[1])&(opcode[0]);//00111


    assign R_add = R&(~ALUop[4])&(~ALUop[3])&(~ALUop[2])&(~ALUop[1])&(~ALUop[0]); //00000 (00000)
    assign R_sub = R&(~ALUop[4])&(~ALUop[3])&(~ALUop[2])&(~ALUop[1])&(ALUop[0]); //00000 (00001)
    assign R_and = R&(~ALUop[4])&(~ALUop[3])&(~ALUop[2])&(ALUop[1])&(~ALUop[0]); //00000 (00010)
    assign R_or = R&(~ALUop[4])&(~ALUop[3])&(~ALUop[2])&(ALUop[1])&(ALUop[0]);//00000 (00011)
    assign R_sll = R&(~ALUop[4])&(~ALUop[3])&(ALUop[2])&(~ALUop[1])&(~ALUop[0]);//00000 (00100)
    assign R_sra = R&(~ALUop[4])&(~ALUop[3])&(ALUop[2])&(~ALUop[1])&(ALUop[0]);//00000 (00101)

endmodule
