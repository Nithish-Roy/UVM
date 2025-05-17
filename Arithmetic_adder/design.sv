//design.sv
module adder_design(
                input       wire            clk     ,
                input       wire            rst     ,
                input       wire    [7:0]   data_1  ,
                input       wire    [7:0]   data_2  ,
                output      reg     [8:0]   out     
);

always @(posedge clk) begin 
    if(rst)
        out <= 9'd0;
    else 
        out <= data_1 + data_2;
end

endmodule





