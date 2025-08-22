`default_nettype none

(* blackbox *)
module tt_main_macro (
`ifdef USE_POWER_PINS
    inout  wire VSS,
    inout  wire VDD,
`endif
    input  wire tt_clk_Y,
    output wire tt_clk_PU,
    output wire tt_clk_PD,
    input  wire [11:0] tt_in_Y,
    output wire [11:0] tt_in_PD,
    output wire [11:0] tt_in_PU,
    input  wire [15:0] tt_bi_Y,
    output wire [15:0] tt_bi_A,
    output wire [15:0] tt_bi_OE,
    output wire [15:0] tt_bi_IE,
    output wire [15:0] tt_bi_SL,
    output wire [15:0] tt_bi_CS,
    output wire [15:0] tt_bi_PD,
    output wire [15:0] tt_bi_PU,
    input  wire [1:0] pt_in_Y,
    output wire [1:0] pt_in_PD,
    output wire [1:0] pt_in_PU,
    input  wire [1:0] pt_bi_Y,
    output wire [1:0] pt_bi_A,
    output wire [1:0] pt_bi_OE,
    output wire [1:0] pt_bi_IE,
    output wire pt_bi_PDRV1,
    output wire pt_bi_PDRV0,
    output wire [2:0] pt_bi_SL,
    output wire [2:0] pt_bi_CS,
    output wire [2:0] pt_bi_PD,
    output wire [2:0] pt_bi_PU
);

endmodule
