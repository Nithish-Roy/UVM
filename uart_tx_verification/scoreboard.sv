//scoreboard.sv

class scoreboard extends uvm_scoreboard;

    `uvm_component_utils(scoreboard)
  
    int next_sel;

  	bit	queue [$]		;
  
  	bit queue_temp[$];
  
  	sequence_item item	;

  	bit [10:0] expected_format;
 
  	bit parity;

	event my_event;  
  
  	uvm_analysis_imp #(sequence_item, scoreboard) scr_port;

    function new(string name = "scoreboard", uvm_component parent);

        super.new(name,parent);

    endfunction

  
    function void build_phase(uvm_phase phase);

       super.build_phase(phase);

       scr_port = new("scr_port",this);
      
    endfunction
  
  
  function [3:0] nibble_reverse(input bit [3:0] nibble);
    
    nibble_reverse = {nibble[0],
                      nibble[1],
                      nibble[2],
                      nibble[3]
    };
    
  endfunction

        function void write(sequence_item item);
          
          queue.push_back(item.tx_out);
          
          parity = ^item.data;

          expected_format = {1'b0,
                        					{nibble_reverse(item.data[3:0]),nibble_reverse(item.data[7:4])},parity,1'b1};
          
          if(next_sel == 0) begin
          
          queue_temp = queue[1:11];
            
          end
          
            else if(next_sel) begin
            
            queue_temp = queue[0:10];
          
            end
          
          if(queue_temp.size() >= 11) begin
          
            compare();
            
          end
            
        endfunction
  
  function void compare();
    
    bit pass;
    
    int count;
    
    foreach(expected_format[i]) begin
      
      if(!(queue_temp[10-i] ^ expected_format[i]))
        
      begin

      count++;

        if (count == 11) begin
        
      		`uvm_error("scoreboard","pass")
      
          	pass = 1'b1;
          
        	count = 0;
        
          	next_sel++;
          
          	queue.delete;
          
			->my_event; 
          
     		end
      
    end
      
    end
    
	endfunction
  
endclass

		
