module not_32_bit(w, data);
   input [31:0] data;
	output[31:0] w;

genvar i;
// generate for block
generate
  for (i = 0; i < 32; i = i + 1) begin: notgate
    // Code to execute
	 not ni(w[i], data[i]);
  end
endgenerate


endmodule
