`default_nettype none

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
    input  wire Y_in,
    output wire [2:0] lb_in_PD,
    output wire [2:0] lb_in_PU,
    input  wire lb_bi_Y,
    output wire lb_bi_OE,
    output wire lb_bi_IE,
    output wire lb_bi_SL,
    output wire lb_bi_CS,
    output wire lb_bi_PD,
    output wire lb_bi_PU
);

assign A_out = A_in;
assign Y_out = Y_in;
assign IE_out = IE_in;
assign OE_out = OE_in;

wire _unused = lb_bi_Y;
assign lb_in_PD = 3'b000;
assign lb_in_PU = 3'b000;
assign lb_bi_OE = 1'b1;
assign lb_bi_IE = 1'b0;
assign lb_bi_SL = 1'b0;
assign lb_bi_CS = 1'b0;
assign lb_bi_PD = 1'b0;
assign lb_bi_PU = 1'b0;

endmodule
