module arithmetic_right_shift_32_bit(out, dta, L);
		input [31:0] dta;
		input [4:0] L;
		output [31:0] out;
		wire [31:0] a, b, c, d;
	
	
	
	
	//Controlled by L0
	m21 mux01(dta[31], dta[31], L[0], a[31]);
	genvar i;
 
	// generate for block
	generate
		for (i = 0; i < 31; i = i + 1) begin: L0
    // Code to execute
		m21 ai(dta[i], dta[i+1], L[0], a[i]);
	end
	endgenerate
	
	
		//Controlled by L1
	m21 mux11(a[31], dta[31], L[1], b[31]);
	m21 mux12(a[30], dta[31], L[1], b[30]);
	genvar j;
 
	// generate for block
	generate
		for (j = 0; j < 30; j = j + 1) begin: L1
    // Code to execute
		m21 bi(a[j], a[j+2], L[1], b[j]);
	end
	endgenerate
	
	
	//Controlled by L2
	m21 mux21_(b[31], dta[31], L[2], c[31]);
	m21 mux22(b[30], dta[31], L[2], c[30]);
	m21 mux23(b[29], dta[31], L[2], c[29]);
	m21 mux24(b[28], dta[31], L[2], c[28]);
	genvar k;
 
	// generate for block
	generate
		for (k = 0; k < 28; k = k + 1) begin: L2
    // Code to execute
		m21 ci(b[k], b[k+4], L[2], c[k]);
	end
	endgenerate
	
		//Controlled by L3
	m21 mux31(c[31], dta[31], L[3], d[31]);
	m21 mux32(c[30], dta[31], L[3], d[30]);
	m21 mux33(c[29], dta[31], L[3], d[29]);
	m21 mux34(c[28], dta[31], L[3], d[28]);
	m21 mux35(c[27], dta[31], L[3], d[27]);
	m21 mux36(c[26], dta[31], L[3], d[26]);
	m21 mux37(c[25], dta[31], L[3], d[25]);
	m21 mux38(c[24], dta[31], L[3], d[24]);
	genvar l;
 
	// generate for block
	generate
		for (l = 0; l < 24; l = l + 1) begin: L3
    // Code to execute
		m21 di(c[l], c[l+8], L[3], d[l]);
	end
	endgenerate
	
	//Controlled by L4
	m21 mux41(d[31], dta[31], L[4], out[31]);
	m21 mux42(d[30], dta[31], L[4], out[30]);
	m21 mux43(d[29], dta[31], L[4], out[29]);
	m21 mux44(d[28], dta[31], L[4], out[28]);
	m21 mux45(d[27], dta[31], L[4], out[27]);
	m21 mux46(d[26], dta[31], L[4], out[26]);
	m21 mux47(d[25], dta[31], L[4], out[25]);
	m21 mux48(d[24], dta[31], L[4], out[24]);
	m21 mux49(d[23], dta[31], L[4], out[23]);
	m21 mux4_10(d[22], dta[31], L[4], out[22]);
	m21 mux4_11(d[21], dta[31], L[4], out[21]);
	m21 mux4_12(d[20], dta[31], L[4], out[20]);
	m21 mux4_13(d[19], dta[31], L[4], out[19]);
	m21 mux4_14(d[18], dta[31], L[4], out[18]);
	m21 mux4_15(d[17], dta[31], L[4], out[17]);
	m21 mux4_16(d[16], dta[31], L[4], out[16]);
	genvar m;
 
	// generate for block
	generate
		for (m = 0; m < 16; m = m + 1) begin: L4
    // Code to execute
		m21 outi(d[m], d[m+16], L[4], out[m]);
	end
	endgenerate

endmodule
