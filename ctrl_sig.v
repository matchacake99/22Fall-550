module ctrl_sig(opcode, ALUop, Rwe, Rdst, ALUinB, DMwe, RWd);
    input [4:0]opcode, ALUop;
    output Rwe, Rdst, ALUinB, DMwe, RWd;
    wire R, addi, lw, sw, R_add, R_sub, R_and, R_or, R_sll, R_sra;

    getSig ctrl_getSig(opcode, ALUop, R, addi, lw, sw, R_add, R_sub, R_and, R_or, R_sll, R_sra);

    assign Rwe = R | addi | lw;
    assign Rdst = R;
    assign ALUinB = addi | sw | lw;
    assign DMwe = sw;
    assign RWd = lw;
endmodule
