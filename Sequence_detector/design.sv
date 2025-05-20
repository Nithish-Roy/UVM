//design.sv
//1010 sequenece detector
//input clk rst i_bit
//output flag

module seq(
            input       wire        clk,
            input       wire        rst,
            input       wire        i_bit,
            output      wire        flag    );

    parameter [2:0] IDLE = 3'b000,
                    S1   = 3'B001,
                    S2   = 3'B010,
                    S3   = 3'B011,
                    S4   = 3'B100;

  reg [3:0] present_state,   next_state;

                    always @(posedge clk or posedge rst) begin 
                        if(rst)
                                present_state <= IDLE;
                            else
                                present_state <= next_state;
                        end


                        always @(*) begin
                            case(present_state)
                                IDLE: if(i_bit) next_state <= S1    ;
                                      else      next_state <= IDLE  ;
                                S1  : if(i_bit) next_state <= S1    ;
                                      else      next_state <= S2    ;
                                S2  : if(i_bit) next_state <= S3    ;
                                      else      next_state <= IDLE  ;
                                S3  : if(i_bit) next_state <= S1    ;
                                      else      next_state <= S4    ;
                                S4  : if(i_bit) next_state <= S3    ;
                                      else      next_state <= IDLE  ;
                               default: next_state <= IDLE;
                            endcase
                        end
                        
                        assign flag = (present_state == S4) ? 1'b1 : 1'b0;

endmodule
