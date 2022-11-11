module adder_1(a, b, cin, sum, cout);
	input a, b, cin;    // List all inputs
	output cout, sum;   // List all outputs
	wire w1, w2, w3;
	xor G1(w1, a, b);
	xor G2(sum, w1, cin);
	and G3(w2, w1, cin);
	and G4(w3, a, b);
	or G5(cout, w2, w3);
endmodule

