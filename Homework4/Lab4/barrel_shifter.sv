// Barrel Shifter RTL Model
//`include "mux_2x1_behavioral.sv"
module barrel_shifter (
  input logic select,  // select=0 shift operation, select=1 rotate operation
  input logic direction, // direction=0 right move, direction=1 left move
  input logic[1:0] shift_value, // number of bits to be shifted (0, 1, 2 or 3)
  input logic[3:0] din,
  output logic[3:0] dout
);

// Students to add code for barrel shifter
wire w0, w1, w2, w3;
logic w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19;
logic [3:0] tdin, tdout;

mux_2x1 Mux0 (w4, w5, shift_value[1], w0);
mux_2x1 Mux1 (w6, w7, shift_value[1], w1);
mux_2x1 Mux2 (w5, w9, shift_value[1], w2);
mux_2x1 Mux3 (w7, w11, shift_value[1], w3);
					
mux_2x1 Mux4 (w12, w13, shift_value[0], tdout[3]);
mux_2x1 Mux5 (w13, w15, shift_value[0], tdout[2]);
mux_2x1 Mux6 (w15, w17, shift_value[0], tdout[1]);
mux_2x1 Mux7 (w17, w19, shift_value[0], tdout[0]);

always_ff @(posedge select, posedge direction, posedge shift_value[1]) begin
	w4 <= tdin[3];
	w5 <= tdin[1];
	w6 <= tdin[2];
	w7 <= tdin[0];
	//w8 <= tdin[1];
	w9 <= tdin[3];
	//w10 <= tdin[0];
	w11 <= tdin[3];
	w12 <= w0;
	w13 <= w1;
	//w14 <= w1;
	w15 <= w2;
	//w16 <= w2;
	w17 <= w3;
	//w18 <= w3;
	w19 <= w0;
end


always begin
	//bit inversion input
	if(direction) begin
		tdin[0] <= din[3];
		tdin[1] <= din[2];
		tdin[2] <= din[1];
		tdin[3] <= din[0];
	end
	else begin
		tdin[0] <= din[0];
		tdin[1] <= din[1];
		tdin[2] <= din[2];
		tdin[3] <= din[3];
	end
end

always begin
	//bit inversion output
	if(direction) begin		
		dout[0] <= tdout[3];
		dout[1] <= tdout[2];
		dout[2] <= tdout[1];
		dout[3] <= tdout[0];
	end
	else begin
		dout[0] <= tdout[0];
		dout[1] <= tdout[1];
		dout[2] <= tdout[2];
		dout[3] <= tdout[3];
	end
end

/*
always_ff @(posedge select, posedge direction, posedge shift_value[1]) begin
	if(select) begin
		if(direction) begin
			if(shift_value == 2'b01) begin
				
			end
			else if(shift_value == 2'b10) 
				dout <= din;
			else if(shift_value == 2'b11)
				dout <= din;
			else 
				dout <= din;
		end
		else begin
			if(shift_value == 2'b01) begin
				dout <= din;
			end
			else if(shift_value == 2'b10) 
				dout <= din;
			else if(shift_value == 2'b11)
				dout <= din;
			else 
				dout <= din;
		end
	end	
	else begin
		if(direction) begin
			if(shift_value == 2'b01) begin
				dout <= din;
			end
			else if(shift_value == 2'b10) 
				dout <= din;
			else if(shift_value == 2'b11)
				dout <= din;
			else 
				dout <= din;
		end
		else begin
			if(shift_value == 2'b01) begin
				dout <= din;
			end
			else if(shift_value == 2'b10) 
				dout <= din;
			else if(shift_value == 2'b11)
				dout <= din;
			else 
				dout <= din;
		end
	end
end

*/

endmodule: barrel_shifter


