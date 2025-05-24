class rst_seq extends uvm_sequence #(sequence_item);

    `uvm_object_utils(rst_seq)

  function new(string name = "rst_seq");

        super.new(name);

    endfunction

    task body();

        sequence_item item = sequence_item::type_id::create("item");

        repeat(1) begin

            start_item(item);

          item.randomize() with { rst == 1'b0; start == 1'b0; data == 1'b0;};

            finish_item(item);

        end

    endtask

endclass



