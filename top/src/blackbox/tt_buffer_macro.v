`default_nettype none

(* blackbox *)
module tt_buffer_macro (
`ifdef USE_POWER_PINS
    inout  wire VSS,
    inout  wire VDD,
`endif
    output wire Y_out,
    input  wire OE_in,
    input  wire A_in,
    input  wire IE_in,
    output wire IE_out,
    output wire A_out,
    output wire OE_out,
    input  wire Y_in
);

endmodule
