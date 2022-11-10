/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

/* YOUR CODE STARTS HERE */


    //PC & PC + 4
     wire [31:0] pc_in, pc_out, insn_out, sign_extend;
     wire dummy;
     wire [4:0] opcode, rd, rs, rt, shamt, ALUopcode;
     wire [31:0] reg_outA, reg_outB, alu_result, data_out;
     wire [1:0] Zeroes;
     wire [16:0] immed;
     wire overflow, R, addi, lw, sw, R_add, R_sub, R_and, R_or, R_sll, R_sra, Rwe, Rdst, ALUinB, DMwe, RWd;
    pc pc1(.pc_out(pc_out), .clock(clock), .reset(reset), .pc_in(pc_in));
    alu(pc_out, 32'd1, 5'b00000, 1'b0, pc_in, dummy, dummy, dummy);   

    //Insn Mem
    assign address_imem = pc_out[11:0];
    assign insn_out = q_imem;

    ctrl_sig(opcode, ALUopcode, Rwe, Rdst, ALUinB, DMwe, RWd);
    assign opcode = insn_out[31:27];
    assign rs = insn_out[21:17];
    assign rt = R? insn_out[16:12]: 5'd0;
    assign rd = insn_out[26:22];
    assign shamt = R?insn_out[11:7]: 5'd0;;
    assign ALUopcode = R?insn_out[6:2]: 5'd0;;
    assign Zeroes = R? insn_out[1:0]: 5'd0;;
    assign immed = insn_out[16:0];
    assign sign_extend = {{15{immed[16]}},immed};



    //RegFile
    assign ctrl_writeEnable = Rwe;
    assign ctrl_writeReg = (R_add|R_sub|addi)? (overflow? 5'd30: rd) : rd;
    assign ctrl_readRegA = rs;
    assign ctrl_readRegB = R? rt : rd;
    regfile myRegfile(
	.clock(clock), .ctrl_writeEnable(ctrl_writeEnable), .ctrl_reset(reset), .ctrl_writeReg(ctrl_writeReg),
	.ctrl_readRegA(ctrl_readRegA), .ctrl_readRegB(ctrl_readRegB), .data_writeReg(data_writeReg), .data_readRegA(data_readRegA),
	.data_readRegB(data_readRegA)
);
    
	 
     
    //ALU 
    assign reg_outA = data_readRegA;
    assign reg_outB = ALUinB? sign_extend : data_readRegB;
    assign overflow_dta= R_add? 32'd1:R_sub? 32'd3:addi? 32'd2:32'd0;
    alu alu_dtapath(.data_operandA(reg_outA), .data_operandB(reg_outB), .ctrl_ALUopcode(ALUopcode),
			.ctrl_shiftamt(shamt), .data_result(alu_result), .isNotEqual(dummy), .isLessThan(dummy), .overflow(overflow));
    


    //Data Mem
    assign address_dmem = alu_result[11:0];
    assign wren = DMwe;
    assign data = data_readRegB;
    assign data_out = q_dmem;
	assign data_writeReg = lw? data_out:alu_result;
    

	 

endmodule

