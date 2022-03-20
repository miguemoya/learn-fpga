/**
 * Step 2: simulation of a Blinker
 *         version with five LEDs
 * Usage:
 *    iverilog step1.v
 *    vvp a.out
 *    to exit: <ctrl><c> then finish
 */

`default_nettype none

module Blink (
    input clock,
    output [4:0] leds
);
   reg [4:0] count;
   initial begin
      count = 0;
   end
   always @(posedge clock) begin
      count <= count + 1;
   end
   assign leds = count;
endmodule

module bench();
   reg clock;
   wire [4:0] leds;

   Blink uut(
     .clock(clock),
     .leds(leds)	     
   );
   
   initial begin
      clock = 0;
      forever begin
	 #1 clock = ~clock;
	 $display("LEDS=%b",leds);
      end
   end
   
endmodule   
   
