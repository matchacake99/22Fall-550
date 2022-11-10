module left_shift_32_bit(out, dta, L);
	input [31:0] dta;
	input [4:0] L;
	output [31:0] out;
	wire [31:0] a, b, c, d;
	
	
	
	
	//Controlled by L0
	m21 mux01(dta[0], 1'b0, L[0], a[0]);
	genvar i;
 
	// generate for block
	generate
		for (i = 0; i < 31; i = i + 1) begin: L0
    // Code to execute
		m21 ai(dta[i+1], dta[i], L[0], a[i+1]);
	end
	endgenerate
	
	
		//Controlled by L1
	m21 mux11(a[0], 1'b0, L[1], b[0]);
	m21 mux12(a[1], 1'b0, L[1], b[1]);
	genvar j;
 
	// generate for block
	generate
		for (j = 0; j < 30; j = j + 1) begin: L1
    // Code to execute
		m21 bi(a[j+2], a[j], L[1], b[j+2]);
	end
	endgenerate
	
	
	//Controlled by L2
	m21 mux21_(b[0], 1'b0, L[2], c[0]);
	m21 mux22(b[1], 1'b0, L[2], c[1]);
	m21 mux23(b[2], 1'b0, L[2], c[2]);
	m21 mux24(b[3], 1'b0, L[2], c[3]);
	genvar k;
 
	// generate for block
	generate
		for (k = 0; k < 28; k = k + 1) begin: L2
    // Code to execute
		m21 ci(b[k+4], b[k], L[2], c[k+4]);
	end
	endgenerate
	
		//Controlled by L3
	m21 mux31(c[0], 1'b0, L[3], d[0]);
	m21 mux32(c[1], 1'b0, L[3], d[1]);
	m21 mux33(c[2], 1'b0, L[3], d[2]);
	m21 mux34(c[3], 1'b0, L[3], d[3]);
	m21 mux35(c[4], 1'b0, L[3], d[4]);
	m21 mux36(c[5], 1'b0, L[3], d[5]);
	m21 mux37(c[6], 1'b0, L[3], d[6]);
	m21 mux38(c[7], 1'b0, L[3], d[7]);
	genvar l;
 
	// generate for block
	generate
		for (l = 0; l < 24; l = l + 1) begin: L3
    // Code to execute
		m21 di(c[l+8], c[l], L[3], d[l+8]);
	end
	endgenerate
	
	//Controlled by L4
	m21 mux41(d[0], 1'b0, L[4], out[0]);
	m21 mux42(d[1], 1'b0, L[4], out[1]);
	m21 mux43(d[2], 1'b0, L[4], out[2]);
	m21 mux44(d[3], 1'b0, L[4], out[3]);
	m21 mux45(d[4], 1'b0, L[4], out[4]);
	m21 mux46(d[5], 1'b0, L[4], out[5]);
	m21 mux47(d[6], 1'b0, L[4], out[6]);
	m21 mux48(d[7], 1'b0, L[4], out[7]);
	m21 mux49(d[8], 1'b0, L[4], out[8]);
	m21 mux4_10(d[9], 1'b0, L[4], out[9]);
	m21 mux4_11(d[10], 1'b0, L[4], out[10]);
	m21 mux4_12(d[11], 1'b0, L[4], out[11]);
	m21 mux4_13(d[12], 1'b0, L[4], out[12]);
	m21 mux4_14(d[13], 1'b0, L[4], out[13]);
	m21 mux4_15(d[14], 1'b0, L[4], out[14]);
	m21 mux4_16(d[15], 1'b0, L[4], out[15]);
	genvar m;
 
	// generate for block
	generate
		for (m = 0; m < 16; m = m + 1) begin: L4
    // Code to execute
		m21 outi(d[m+16], d[m], L[4], out[m+16]);
	end
	endgenerate

endmodule
