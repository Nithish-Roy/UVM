//scoreboard.sv

`define LENGTH 4

class scoreboard extends uvm_scoreboard;

    `uvm_component_utils(scoreboard)

  uvm_analysis_imp #(sequence_item, scoreboard) scr_port;

        bit [`LENGTH-1:0] ACTUAL_PATTERN    ;

        bit [`LENGTH-1:0] RECEIVED_PATTERN  ;

        bit               PATTERN           ;
  
  		bit			  	  EXP_OUT			;

    function new(string name = "scoreboard", uvm_component parent);

        super.new(name,parent);

    endfunction

    function void build_phase(uvm_phase phase);

       super.build_phase(phase);

      scr_port = new("scr_port",this);

        if(!(uvm_config_db #(bit[`LENGTH-1:0])::get(this, "", "PATTERN", ACTUAL_PATTERN)))begin 

            `uvm_error("DRIVER", "cannot get the PATTERN from config_db");

        end
       
        endfunction

        function void write(sequence_item item);

            RECEIVED_PATTERN = RECEIVED_PATTERN << 1 | item.i_bit;

          `uvm_info("SCOREBOARD", $sformatf("in=%0d flag=%0d ref=%0B act=0b%0b",
                               item.i_bit, item.flag,RECEIVED_PATTERN , ACTUAL_PATTERN), UVM_LOW)

          
          if(EXP_OUT == item.flag) begin 
                     
            `uvm_info("SCOREBOARD", $sformatf(" flag=%0d exp_flag = %b ", item.flag, EXP_OUT), UVM_LOW)
            
            `uvm_error("SCOREBOARD", "PASSED")

          end
          else begin
            
            `uvm_info("SCOREBOARD", $sformatf(" flag=%0d exp_flag = %b ", item.flag, EXP_OUT), UVM_LOW)

            `uvm_error("SCOREBOARD", "FAILED")

          end            
          
          
          
          
          if (!(RECEIVED_PATTERN ^ ACTUAL_PATTERN)) begin
            
            `uvm_error("SCOREBOARD", "THE PATTERN WAS DETECETED THE NEXT OUTPUT MUST BE 1")
          
            EXP_OUT = 1'B1;
            
            $display("_______________________________________________________________________________________________________________________________________");
            
              end

              else begin
                
                `uvm_error("SCOREBOARD", "THE PATTERN IS NOT YET DETECETED THE NEXT OUTPUT MUST BE 0")
                
				EXP_OUT = 1'B0;
                
                $display("_______________________________________________________________________________________________________________________________________");
                
              end

          endfunction 

      endclass










