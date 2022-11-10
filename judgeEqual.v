module judgeEqual(out, i);
	input [31:0] i;
	wire [31:2] k;
	output out;
	
	
	or o0(k[2], i[0], i[1]);
	or o31(out, k[31], i[31]);
	genvar j;
 
	// generate for block
	generate
		for (j = 2; j < 31; j = j + 1) begin: orcat
    // Code to execute
		or oi(k[j+1], k[j], i[j]);
	end
	endgenerate
	
endmodule
