class seq extends uvm_sequence;

    `uvm_object_utils(seq)

    sequence_item item;

    function new(string name = "seq");

        super.new(name);

    endfunction

    task body();

        item = sequence_item::type_id::create("item");
       
      for(int i = 0;  i < 30; i++) begin

          if(i == 1) begin

                start_item(item);

                item.randomize() with {rst == 1'b1;};

                finish_item(item);

            	`uvm_info("sequence",  $sformatf(" in sequence i_bit = %b", item.i_bit), UVM_LOW)

            end

            else begin

                start_item(item);

                item.randomize() with {rst == 1'b0;};

                finish_item(item);

              `uvm_info("sequence", $sformatf("in sequence i_bit = %b", item.i_bit), UVM_LOW)

            end

    end

    endtask

endclass
