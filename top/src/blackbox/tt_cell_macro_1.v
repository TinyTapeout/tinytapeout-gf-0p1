`default_nettype none

(* blackbox *)
module tt_cell_macro_1 (
`ifdef USE_POWER_PINS
    inout  wire VSS,
    inout  wire VDD,
`endif
    input  wire hclk_Y,
    output wire hclk_PD,
    output wire hclk_PU,
    input  wire hsig_Y,
    output wire hsig_A,
    output wire hsig_OE,
    output wire hsig_IE,
    output wire hsig_SL,
    output wire hsig_CS,
    output wire hsig_PD,
    output wire hsig_PU
);

endmodule
