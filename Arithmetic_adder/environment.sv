class environment extends uvm_env;

  `uvm_component_utils(environment)

    agent agnt;

    scoreboard scr;

    function new(string name = "environment", uvm_component parent);

    super.new(name, parent);

    endfunction 

    function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    agnt = agent::type_id::create("agnt",this);

    scr = scoreboard::type_id::create("scr",this);

    endfunction

    function void connect_phase(uvm_phase phase);

    super.connect_phase(phase);

    agnt.mon.mon_port.connect(scr.scr_port);

    endfunction

    task run_phase(uvm_phase phase);

    super.run_phase(phase);

      endtask
    
endclass
