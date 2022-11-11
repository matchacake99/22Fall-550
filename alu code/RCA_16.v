module RCA_16(a, b, cin, s, cout, overflow_detection);
	input [15:0] a;
	input [15:0] b;
	input cin;
	output [15:0] s;
	output cout;
	output overflow_detection;
	wire [15:1] c;
	
	
	adder_1 f0(a[0], b[0], cin, s[0], c[1]);

// Declare the loop variable
genvar i;
 
// generate for block
generate
  for (i = 1; i < 15; i = i + 1) begin: cat
    // Code to execute
	 adder_1 fi(a[i], b[i], c[i], s[i], c[i+1]);
  end
endgenerate
	adder_1 f15(a[15], b[15], c[15], s[15], cout);
	
	xor(overflow_detection, c[15], cout);

	
endmodule
