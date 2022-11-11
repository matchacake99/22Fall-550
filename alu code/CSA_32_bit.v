module CSA_32_bit(data_operandA, w2, ctrl, data_result, overflow);
   input [31:0] data_operandA, w2;
   input ctrl;

   output [31:0] data_result;
   output overflow;

   // wire //
	wire [2:0] cout;
	wire [15:0] s1, s2;
	wire overflow_detection[2:0];


	RCA_16 FA0(
	.a(data_operandA[15:0]),
	.b(w2[15:0]),
	.cin(ctrl),
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
	
endmodule
