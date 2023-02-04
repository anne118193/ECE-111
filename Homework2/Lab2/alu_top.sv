// N-bit ALU behavioral code
`timescale 1ns/1ps
module alu_top // Module start declaration
#(parameter N=4) // Parameter declaration
( input logic clk, reset,
   input logic[N-1:0]opnd1, opnd2, //renamed input names to match alu module
   input logic[1:0] operation,
   output logic[N-1:0] result
);

  // Local net declaration
  logic[N-1:0] out;  //renamed output names to match alu module

  // Instantiation of module alu
  /* origional code
  alu #(.N(N)) alu_instance(
	.opnd1(operand1), 
    .opnd2(operand2), 
	.operation(operation),
    .out(alu_out)
  );
 */
  
  // Instantiation of module alu
  /*changing from explicity name based port to 
  dot-star based port */
  alu #(.N(N)) alu_instance(
    .*
  );


  // Register alu output	
  always@(posedge clk or posedge reset) begin
    if(reset == 1) begin
      result <= 0;
    end
    else begin
      result <= out;
    end
  end
endmodule: alu_top // Module alu_top end declaration