class alu_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(alu_scoreboard);
  
  uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scr_port;
  
  alu_sequence_item transactions[$];
  
  //new constructor
  
  function new(string name = "alu_scoreboard" , uvm_component parent);
	
    super.new(name, parent);
    
    endfunction
  
  //build_phase
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    `uvm_info("alu_scoreboard", "BUILD PHASE OF ENV", UVM_HIGH)
    
    scr_port = new("scr_port", this);
 
    endfunction
  
  //connect phase 
  
    function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
      `uvm_info("alu_scoreboard", "CONNECT PHASE OF ENV", UVM_HIGH)
    
    endfunction

  //write function
  
  function void write(alu_sequence_item item);
    
    transactions.push_back(item);
    
  endfunction
  
  
  //run phase 
  
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    
   forever begin 
     
     alu_sequence_item temp;
     
     wait(transactions.size != 0)
     
     temp = transactions.pop_front();
     
     tester(temp);
     
   end
    
  endtask
       
	//scoreboard logic
  
  task tester(alu_sequence_item temp);
    
    logic [7:0] expected_out;
    
    logic expected_carry;

    
    case (temp.opcode)
      
      0: {expected_carry,expected_out} = temp.a + temp.b;
 	  
      1: {expected_carry,expected_out} = temp.a - temp.b;
	
      2: {expected_carry,expected_out} = temp.a * temp.b;
      
      3: {expected_carry,expected_out} = temp.a / temp.b;

      default: {expected_carry,expected_out} = 9'd0;
      
    endcase
    
    if({expected_carry,expected_out} != {temp.carry,temp.out})
      
      `uvm_error("COMPARE", $sformatf("a = %d b = %d Transaction failed! ACT=%d, EXP=%d",temp.a, temp.b, {temp.carry,temp.out}, {expected_carry,expected_out}))
    
      else 
       
        `uvm_error("COMPARE", $sformatf("Transaction passed! ACT=%d, EXP=%d", {temp.carry,temp.out}, {expected_carry,expected_out}))
    
        endtask

endclass
