interface top(input logic clk);

	logic		reset		;
	logic		send		;
	logic		p_sel		;
  logic [7:0]	d_in		;
	logic 		tx			;
	logic		rx			;
  logic [7:0]	d_out		;
	logic		p_error		;
	logic		stop_error	;

 endinterface
