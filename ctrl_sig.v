module ctrl_sig(Rwe, Rdst, ALUinB, DMwe, RWd);
    input [4:0]opcode, ALUop;
    output Rwe, Rdst, ALUinB, DMwe, RWd
    wire R, addi, lw, sw

    getSig(opcode, R, addi, lw, sw);

    assign Rwe = R | addi | lw;
    assign Rdst = R;
    assign ALUinB = addi | sw | lw;
    assign DMwe = sw;
    assign RWd = lw;
endmodule