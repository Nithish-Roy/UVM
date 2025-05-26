interface baud_ticker (input logic clk);

  logic rst				;
  
  logic baud_ticks		;
  
  localparam N =  16, M = 5208;
  
  logic [N-1:0] counter	;
  
  logic	[N-1:0] next	;
  
  always @(posedge clk , posedge rst) begin
    
    if(!rst) 
      
      counter<= 0;
    
    else 
      
      counter <=  next;
    
    
  end
  
  
  assign next = (counter == (M-1)) ? 0 : counter + 1'b1;
  
  assign baud_ticks = (counter == (M-1)) ? 1'b1:1'b0;
  
endinterface
  
