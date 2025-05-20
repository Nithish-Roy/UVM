interface alu_interface(input logic clk);
  
  logic 		reset;
  logic [7:0] 	A;
  logic [7:0]	B;
  logic [3:0] 	select_line;
  logic [7:0] 	out;
  logic 		carry;
  
endinterface
