// 1-bit ALU behavioral code
`timescale 1ns/1ps
module alu // Module start declaration
#(parameter N=1) // Parameter declaration
(
  input logic[N-1:0] opnd1, opnd2,
  input logic[1:0] operation,
  output logic[N-1:0] out
);
  always@(opnd1 or opnd2 or operation) 
  begin
    case(operation)
      2'b00: out = opnd1 + opnd2; 
      2'b01: out = opnd1 - opnd2; 
      2'b10: out = opnd1 & opnd2;
      2'b11: out = opnd1 | opnd2; 
    endcase
  end
endmodule: alu

// 4-bit ALU behavioral code
//done need to do this, 4bit alu is 4 1bit alus cascaded 
//together so just change to N=4 in the top mod
/*
`timescale 1ns/1ps
module alu
#(parameter N=4)
(
	input logic[N-1:0] opnd1, opnd2, //not sure if i need opnd3
	input logic[1:0] operation,
	output logic[N-1:0] out
);
	always@(opnd1 or opnd2 or operation) // not sure if i need opnd3
	begin
		case(operation)
			3'b000: out = opnd1 + opnd2;
			3'b001: out = opnd1 - opnd2;
			3'b010: out = opnd1 << 1;	//shift left
			3'b011: out = opnd1 >> 1;	//shift right
			3'b100: out = opnd1 & opnd2;
			3'b101: out = opnd1 | opnd2;
			3'b110: out = ~opnd1;		//not
			3'b111: out = ~(opnd1 | opnd2); //xnor
		endcase
	end
endmodule: alu
*/

			

