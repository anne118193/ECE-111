//johnson counter
`timescale 1ns/1ns
module johnson_counter

#(parameter WIDTH=4)
(
	input logic clk,
	input logic clear,
	input logic preset,
	input reg[WIDTH-1:0] load_cnt,
	output reg[WIDTH-1:0] count
);


always @(posedge clk, negedge clear) begin
	if(!clear)
		count <= 0;
	else if(!preset)
		count <= load_cnt;
	else begin	
		count[WIDTH-1] <= ~count[0];
			for(int i=0; i<WIDTH-1; i=i+1) begin	
				count[i] <= count[i+1];
			end
	end	
end

endmodule: johnson_counter



/*
always @(posedge clk) begin
	if(!reset)
		count <= 1;
	else begin	
		count[WIDTH-1] <= ~count[0];
			for(int i=0; i<WIDTH-1; i=i+1) begin	
				count[i] <= count[i+1];
			end
	end
end
*/