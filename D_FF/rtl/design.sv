module d_flip_flop(

	input      clk,
  	input      rst,
	input  	   d  ,
  	output reg q  ,
  	output     q_b

);
  
  always@(posedge clk)begin
    if(!rst)
      q <= 0;
    else
      q <= d;
  end
  
  assign q_b = ~q;
  
endmodule
