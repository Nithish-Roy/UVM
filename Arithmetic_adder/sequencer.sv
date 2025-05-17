//sequencer.sv
class sequencer extends uvm_sequencer #(sequence_item);

    `uvm_component_utils(sequencer)

    function new(string name = "sequencer", uvm_component parent = null);

    super.new(name, parent);

    endfunction 

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);
        
        `uvm_info("sequencer", "inside build_phase", UVM_HIGH);

    endfunction 

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        `uvm_info("sequencer", "inside connect_phase", UVM_HIGH);
    
    endfunction

    endclass
