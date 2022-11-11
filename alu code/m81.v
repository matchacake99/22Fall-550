module m81(i0, i1 ,i2 ,i3 ,i4 ,i5 ,i6 ,i7 ,s0 ,s1 ,s2 ,out);
	input i0, i1 ,i2 ,i3 ,i4 ,i5 ,i6 ,i7;
	input s0, s1, s2;
	output out;
	wire k[5:0];
	
	//use m21 to build m81
	m21 part1(i0, i1, s0, k[0] );
	m21 part2(i2, i3, s0, k[1] );
	m21 part3(i4, i5, s0, k[2] );
	m21 part4(i6, i7, s0, k[3] );
	m21 part5(k[0], k[1], s1, k[4] );
	m21 part6(k[2], k[3], s1, k[5] );
	m21 part7(k[4], k[5], s2, out);
	
endmodule
