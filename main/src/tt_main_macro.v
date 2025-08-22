`default_nettype none

module tt_main_macro (
`ifdef USE_POWER_PINS
    inout  wire VSS,
    inout  wire VDD,
`endif
    input  wire tt_clk_Y,
    output wire tt_clk_PD,
    output wire tt_clk_PU,
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

wire clk;
wire rst_n;
wire [7:0] ui_in;
wire [7:0] uo_out;
wire [7:0] uio_in;
wire [7:0] uio_out;
wire [7:0] uio_oe;
wire ctrl_sel_rst_n;
wire ctrl_sel_inc;
wire ctrl_ena;

wire [3:0] pad_in;
wire [1:0] pad_out;
wire [21:0] pad_config;

wire [4:0] addr;

counter counter_inst (
    .ctrl_sel_rst_n,
    .ctrl_sel_inc,
    .addr
);

wire [17:0] iw;
wire [23:0] ow;

assign iw = {uio_in, ui_in, rst_n, clk};
assign {uio_oe, uio_out, uo_out} = ow;

basic_mux mux_inst (
    .ena (ctrl_ena),
    .addr,
    .iw,
    .ow,
    .pad_in,
    .pad_out,
    .pad_config
);

wire [7:0] _unused;

assign clk = tt_clk_Y;
assign {ctrl_ena, ctrl_sel_inc, ctrl_sel_rst_n, ui_in, rst_n} = tt_in_Y;
assign {uio_in, _unused} = tt_bi_Y;

assign tt_clk_PD = 1'b0;
assign tt_clk_PU = 1'b0;
assign tt_in_PD = 12'b000000000000;
assign tt_in_PU = 12'b000000000000;
assign tt_bi_A = {uio_out, uo_out};
assign tt_bi_OE = {8'b11111111, uio_oe};
assign tt_bi_IE = {8'b00000000, ~uio_oe};
assign tt_bi_SL = 16'b0000000000000000;
assign tt_bi_CS = 16'b0000000000000000;
assign tt_bi_PD = 16'b0000000000000000;
assign tt_bi_PU = 16'b0000000000000000;

assign pad_in = {pt_bi_Y, pt_in_Y};

assign pt_bi_A = pad_out;
assign pt_in_PD = {pad_config[3], pad_config[1]};
assign pt_in_PU = {pad_config[2], pad_config[0]};
assign pt_bi_OE = {pad_config[17], pad_config[11]};
assign pt_bi_IE = {pad_config[16], pad_config[10]};
assign pt_bi_PDRV1 = pad_config[9];
assign pt_bi_PDRV0 = pad_config[8];
assign pt_bi_SL = {pad_config[21], pad_config[15], pad_config[7]};
assign pt_bi_CS = {pad_config[20], pad_config[14], pad_config[6]};
assign pt_bi_PD = {pad_config[19], pad_config[13], pad_config[5]};
assign pt_bi_PU = {pad_config[18], pad_config[12], pad_config[4]};

endmodule
