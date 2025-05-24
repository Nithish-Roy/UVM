`include "baud_gen.v"
`include "uart_tx.v"

module uart_tx_top (
    input        clk,      // system clock
    input        reset,    // active-low reset
    input        start,    // start transmission
    input  [7:0] data,     // byte to send
    output       tx_out,    // serial TX line
    output 	baud_wire
);

    /*------------------------------------------------------------
     *  Baud-rate generator
     *----------------------------------------------------------*/
    //wire baud_wire;

    baud_tick_generator u_baud (
        .clk      	(clk),
        .reset    	(reset),
        .baud_tick 	(baud_wire)
    );

    /*------------------------------------------------------------
     *  UART transmitter
     *----------------------------------------------------------*/
    uart_tx_d u_tx (
        .clk   		(clk),
        .data  		(data),
        .baud_tick	(baud_wire),   // strobe at baud rate
        .start 		(start),
        .tx  		(tx_out)
    );

endmodule


