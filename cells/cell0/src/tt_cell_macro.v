`default_nettype none

module tt_cell_macro_0 (
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

wire clk;
wire signal;

heartbeat_0 hb_inst (
`ifdef USE_POWER_PINS
    .VSS,
    .VDD,
`endif
    .clk,
    .signal
);

wire _unused;

assign clk = hclk_Y;
assign _unused = &{hsig_Y, 1'b0};

assign hclk_PD = 1'b0;
assign hclk_PU = 1'b0;
assign hsig_A = signal;
assign hsig_OE = 1'b1;
assign hsig_IE = 1'b0;
assign hsig_SL = 1'b0;
assign hsig_CS = 1'b0;
assign hsig_PD = 1'b0;
assign hsig_PU = 1'b0;

endmodule
