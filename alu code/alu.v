module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire [31:0] w1_add, w2_add, w1_sub, w2_sub;
	wire [2:0] cout;
	wire [15:0] s1, s2;
	wire [31:0] k1, k2, k3, k4, k5, k6;
	wire overflow_detection[2:0];
	wire overflow_sub, overflow_add;
	
	//AND Function
	// Declare the loop variable
genvar a;
 
// generate for block
generate
  for (a = 0; a < 32; a = a + 1) begin: andgate
    // Code to execute
	 and ai(k1[a], data_operandA[a], data_operandB[a]);
  end
endgenerate





	//OR Function
	// Declare the loop variable
genvar b;
 
// generate for block
generate
  for (b = 0; b < 32; b = b + 1) begin: orgate
    // Code to execute
	 or bi(k2[b], data_operandA[b], data_operandB[b]);
  end
endgenerate

	
	
	//Sub
	not_32_bit not_sub(w1_sub, data_operandB);
	m21_32_bit mux21_sub(data_operandB, w1_sub, 1'b1, w2_sub);
	CSA_32_bit C_Sub(data_operandA, w2_sub, 1'b1, k5, overflow_sub);
	
	//Add
	not_32_bit not_add(w1_add, data_operandB);
	m21_32_bit mux21_add(data_operandB, w1_add, 1'b0, w2_add);
	CSA_32_bit C_Add(data_operandA, w2_add, 1'b0, k6, overflow_add);
	
	//Left Shift
	left_shift_32_bit SLL(k3, data_operandA, ctrl_shiftamt);
	
	//Right Shift
	arithmetic_right_shift_32_bit SRA(k4, data_operandA, ctrl_shiftamt);

	//isNotEqual(not finished)
	//assign ternary_output=cond?High:Low;
	judgeEqual j1(isNotEqual, k5);
	
	//isLessThan(
	judgeLess j2(isLessThan, k5[31]);
	
	//overflow
	m21 or_overflow(overflow_add, overflow_sub, ctrl_ALUopcode[0], overflow);
	
	//Use MUX81 to cat ALU functions
	//m81(i[0], i[1],i[2], i[3],i[4], i[5],i[6], i[7], s[0], s[1], s[2], out);
		// Declare the loop variable
	genvar z;
 
	// generate for block
	generate
	for (z = 0; z < 32; z = z + 1) begin: m81_ALU
    // Code to execute
	 m81 mux_cat(k6[z], k5[z], k1[z], k2[z], k3[z], k4[z], 1'b0, 1'b0, ctrl_ALUopcode[0], ctrl_ALUopcode[1], ctrl_ALUopcode[2], data_result[z]);
	end
	endgenerate
	
	
	
	/**
	Not for 32 bits
	
	//not(w1[31:0], data_operandB[31:0]);//can i use this?-no
	// Declare the loop variable
genvar i;
 
// generate for block
generate
  for (i = 0; i < 32; i = i + 1) begin: notgate
    // Code to execute
	 not ni(w1[i], data_operandB[i]);
  end
endgenerate

	
	//m21(w1[31:0], data_operandB[31:0], ctrl_ALUopcode[0], w2[31:0]);//cannot use this
		// Declare the loop variable
genvar j;
 
// generate for block
generate
  for (j = 0; j < 32; j = j + 1) begin: mux1
    // Code to execute
	 m21 mux_onei(data_operandB[j], w1[j], ctrl_ALUopcode[0], w2[j]);
  end
endgenerate
**/


/**

CSA32 + Overflow

//RCA16
	
	RCA_16 FA0(
	.a(data_operandA[15:0]),
	.b(w2[15:0]),
	.cin(ctrl_ALUopcode[0]),
	.s(data_result[15:0]),
	.cout(cout[0]),
	.overflow_detection(overflow_detection[0]));
	
	RCA_16 FA1(
	.a(data_operandA[31:16]),
	.b(w2[31:16]),
	.cin(1'b0),
	.s(s1[15:0]),
	.cout(cout[1]),
	.overflow_detection(overflow_detection[1]));
	
	RCA_16 FA2(
	.a(data_operandA[31:16]),
	.b(w2[31:16]),
	.cin(1'b1),
	.s(s2[15:0]),
	.cout(cout[2]),
	.overflow_detection(overflow_detection[2]));
	

	
	//m21(s1[15:0], s2[15:0], cout[0], data_result[31:16]);//cannot use this
		// Declare the loop variable
genvar n;
 
// generate for block
generate
  for (n = 0; n < 16; n = n + 1) begin: mux2
    // Code to execute
	 m21 mux_twoi(s1[n], s2[n], cout[0], data_result[n+16]);
  end
endgenerate
	
	
	//mux for overflow
	m21 mux_three(overflow_detection[1], overflow_detection[2], cout[0], overflow);
	**/

endmodule
