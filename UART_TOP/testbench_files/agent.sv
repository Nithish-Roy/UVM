class agent extends uvm_agent;

    `uvm_component_utils(agent)

    sequencer seqr      ;
    driver    drv       ;
    monitor   mon       ;

    function new(string name = "agent", uvm_component parent);
        
        super.new(name, parent);

    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        `uvm_info("agent", "in the build_phase", UVM_LOW)

      mon = monitor::type_id::create("mon", this);

      drv = driver::type_id::create("drv", this);

      seqr = sequencer::type_id::create("seqr", this);

    endfunction

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        `uvm_info("agent", "in the connect_phase", UVM_LOW)

      	drv.seq_item_port.connect(seqr.seq_item_export);

    endfunction

endclass
