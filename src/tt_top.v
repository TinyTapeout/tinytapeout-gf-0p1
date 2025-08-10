`default_nettype none

module tt_top (
`ifdef USE_POWER_PINS
    inout wire VSS,
    inout wire VDD,
`endif
    inout wire [17:0] in_c__pad,
    inout wire [14:0] bi_t__pad
);

wire ctrl_sel_rst_n;
wire ctrl_sel_inc;
wire ctrl_ena;
wire [7:0] ui_in;
wire [7:0] uo_out;
wire [7:0] uio_in;
wire [7:0] uio_out;
wire [7:0] uio_oe;
wire clk;
wire rst_n;

wire [4:0] addr;

counter counter_I (
    .ctrl_sel_rst_n(ctrl_sel_rst_n),
    .ctrl_sel_inc  (ctrl_sel_inc),
    .addr          (addr)
);

wire [17:0] iw;
wire [23:0] ow;

assign iw = {uio_in, ui_in, rst_n, clk};
assign {uio_oe, uio_out, uo_out} = ow;

basic_mux mux_I (
    .ena (ctrl_ena),
    .addr(addr),
    .iw  (iw),
    .ow  (ow)
);

wire [17:0] in_c__in;
wire [14:0] bi_t__in;
wire [14:0] bi_t__out;
wire [14:0] bi_t__oe;

wire [11:0] _ignore;

assign {_ignore[11:8], uio_in[7], ui_in, rst_n, clk, ctrl_ena, ctrl_sel_inc, ctrl_sel_rst_n} = in_c__in;
assign {uio_in[6:0], _ignore[7:0]} = bi_t__in;
assign bi_t__out = {uio_out[6:0], uo_out};
assign bi_t__oe = {uio_oe[6:0], {8{1'b1}}};

// IO_SOUTH
(* keep *) gf180mcu_fd_io__asig_5p0 pad_s_0 (/*.ASIG5V(asig_5p0__pad[0])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_s_1 (/*.ASIG5V(asig_5p0__pad[1])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_s_2 (/*.ASIG5V(asig_5p0__pad[2])*/);
(* keep *) gf180mcu_fd_io__dvss pad_s_3 (/*.DVSS(dvss__pad[0])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_s_4 (/*.ASIG5V(asig_5p0__pad[3])*/);
(* keep *) gf180mcu_fd_io__dvss pad_s_5 (/*.DVSS(dvss__pad[1])*/);
(* keep *) gf180mcu_fd_io__in_c pad_s_6 (.PAD(in_c__pad[0]), .Y(in_c__in[0]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_s_7 (.PAD(in_c__pad[1]), .Y(in_c__in[1]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_s_8 (.PAD(in_c__pad[2]), .Y(in_c__in[2]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_s_9 (.PAD(in_c__pad[3]), .Y(in_c__in[3]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__dvdd pad_s_10 (/*.DVDD(dvdd__pad[0])*/);
(* keep *) gf180mcu_fd_io__in_c pad_s_11 (.PAD(in_c__pad[4]), .Y(in_c__in[4]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_s_12 (.PAD(in_c__pad[5]), .Y(in_c__in[5]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_s_13 (.PAD(in_c__pad[6]), .Y(in_c__in[6]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_s_14 (.PAD(in_c__pad[7]), .Y(in_c__in[7]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__dvss pad_s_15 (/*.DVSS(dvss__pad[2])*/);
(* keep *) gf180mcu_fd_io__in_c pad_s_16 (.PAD(in_c__pad[8]), .Y(in_c__in[8]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_s_17 (.PAD(in_c__pad[9]), .Y(in_c__in[9]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_s_18 (.PAD(in_c__pad[10]), .Y(in_c__in[10]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_s_19 (.PAD(in_c__pad[11]), .Y(in_c__in[11]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__dvdd pad_s_20 (/*.DVDD(dvdd__pad[1])*/);
(* keep *) gf180mcu_fd_io__in_c pad_s_21 (.PAD(in_c__pad[12]), .Y(in_c__in[12]), .PU(1'b0), .PD(1'b0));

// IO_EAST
(* keep *) gf180mcu_fd_io__in_c pad_e_0 (.PAD(in_c__pad[13]), .Y(in_c__in[13]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_e_1 (.PAD(in_c__pad[14]), .Y(in_c__in[14]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_e_2 (.PAD(in_c__pad[15]), .Y(in_c__in[15]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__dvss pad_e_3 (/*.DVSS(dvss__pad[3])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_e_4 (/*.ASIG5V(asig_5p0__pad[4])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_e_5 (/*.ASIG5V(asig_5p0__pad[5])*/);
(* keep *) gf180mcu_fd_io__dvss pad_e_6 (/*.DVSS(dvss__pad[4])*/);
// positions 7..18 (pads 29..40) skipped
(* keep *) gf180mcu_fd_io__dvss pad_e_19 (/*.DVSS(dvss__pad[5])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_e_20 (/*.ASIG5V(asig_5p0__pad[6])*/);
(* keep *) gf180mcu_fd_io__dvss pad_e_21 (/*.DVSS(dvss__pad[6])*/);

// IO_NORTH
// position 21 (pad 44) skipped
(* keep *) gf180mcu_fd_io__dvdd pad_n_20 (/*.DVDD(dvdd__pad[2])*/);
// positions 19 & 18 (pads 46 & 47) skipped
(* keep *) gf180mcu_fd_io__asig_5p0 pad_n_17 (/*.ASIG5V(asig_5p0__pad[7])*/);
(* keep *) gf180mcu_fd_io__dvss pad_n_16 (/*.DVSS(dvss__pad[7])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_n_15 (/*.ASIG5V(asig_5p0__pad[8])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_n_14 (/*.ASIG5V(asig_5p0__pad[9])*/);
(* keep *) gf180mcu_fd_io__dvss pad_n_13 (/*.DVSS(dvss__pad[8])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_n_12 (/*.ASIG5V(asig_5p0__pad[10])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_n_11 (/*.ASIG5V(asig_5p0__pad[11])*/);
(* keep *) gf180mcu_fd_io__dvss pad_n_10 (/*.DVSS(dvss__pad[9])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_n_9 (/*.ASIG5V(asig_5p0__pad[12])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_n_8 (/*.ASIG5V(asig_5p0__pad[13])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_n_7 (/*.ASIG5V(asig_5p0__pad[14])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_n_6 (/*.ASIG5V(asig_5p0__pad[15])*/);
(* keep *) gf180mcu_fd_io__dvdd pad_n_5 (/*.DVDD(dvdd__pad[3])*/);
(* keep *) gf180mcu_fd_io__in_c pad_n_4 (.PAD(in_c__pad[16]), .Y(in_c__in[16]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__in_c pad_n_3 (.PAD(in_c__pad[17]), .Y(in_c__in[17]), .PU(1'b0), .PD(1'b0));
(* keep *) gf180mcu_fd_io__dvdd pad_n_2 (/*.DVDD(dvdd__pad[4])*/);
(* keep *) gf180mcu_fd_io__dvss pad_n_1 (/*.DVSS(dvss__pad[10])*/);
(* keep *) gf180mcu_fd_io__bi_t pad_n_0 (.PAD(bi_t__pad[0]), .Y(bi_t__in[0]), .A(bi_t__out[0]), .OE(bi_t__oe[0]), .IE(!bi_t__oe[0]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));

// IO_WEST
(* keep *) gf180mcu_fd_io__bi_t pad_w_21 (.PAD(bi_t__pad[1]), .Y(bi_t__in[1]), .A(bi_t__out[1]), .OE(bi_t__oe[1]), .IE(!bi_t__oe[1]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_20 (.PAD(bi_t__pad[2]), .Y(bi_t__in[2]), .A(bi_t__out[2]), .OE(bi_t__oe[2]), .IE(!bi_t__oe[2]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__dvdd pad_w_19 (/*.DVDD(dvdd__pad[5])*/);
(* keep *) gf180mcu_fd_io__bi_t pad_w_18 (.PAD(bi_t__pad[3]), .Y(bi_t__in[3]), .A(bi_t__out[3]), .OE(bi_t__oe[3]), .IE(!bi_t__oe[3]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_17 (.PAD(bi_t__pad[4]), .Y(bi_t__in[4]), .A(bi_t__out[4]), .OE(bi_t__oe[4]), .IE(!bi_t__oe[4]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_16 (.PAD(bi_t__pad[5]), .Y(bi_t__in[5]), .A(bi_t__out[5]), .OE(bi_t__oe[5]), .IE(!bi_t__oe[5]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_15 (.PAD(bi_t__pad[6]), .Y(bi_t__in[6]), .A(bi_t__out[6]), .OE(bi_t__oe[6]), .IE(!bi_t__oe[6]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__dvss pad_w_14 (/*.DVSS(dvss__pad[11])*/);
(* keep *) gf180mcu_fd_io__bi_t pad_w_13 (.PAD(bi_t__pad[7]), .Y(bi_t__in[7]), .A(bi_t__out[7]), .OE(bi_t__oe[7]), .IE(!bi_t__oe[7]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_12 (.PAD(bi_t__pad[8]), .Y(bi_t__in[8]), .A(bi_t__out[8]), .OE(bi_t__oe[8]), .IE(!bi_t__oe[8]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_11 (.PAD(bi_t__pad[9]), .Y(bi_t__in[9]), .A(bi_t__out[9]), .OE(bi_t__oe[9]), .IE(!bi_t__oe[9]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_10 (.PAD(bi_t__pad[10]), .Y(bi_t__in[10]), .A(bi_t__out[10]), .OE(bi_t__oe[10]), .IE(!bi_t__oe[10]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__dvdd pad_w_9 (/*.DVDD(dvdd__pad[6])*/);
(* keep *) gf180mcu_fd_io__bi_t pad_w_8 (.PAD(bi_t__pad[11]), .Y(bi_t__in[11]), .A(bi_t__out[11]), .OE(bi_t__oe[11]), .IE(!bi_t__oe[11]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_7 (.PAD(bi_t__pad[12]), .Y(bi_t__in[12]), .A(bi_t__out[12]), .OE(bi_t__oe[12]), .IE(!bi_t__oe[12]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_6 (.PAD(bi_t__pad[13]), .Y(bi_t__in[13]), .A(bi_t__out[13]), .OE(bi_t__oe[13]), .IE(!bi_t__oe[13]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__bi_t pad_w_5 (.PAD(bi_t__pad[14]), .Y(bi_t__in[14]), .A(bi_t__out[14]), .OE(bi_t__oe[14]), .IE(!bi_t__oe[14]), .PDRV1(1'b1), .PDRV0(1'b0), .SL(1'b0), .CS(1'b0), .PD(1'b0), .PU(1'b0));
(* keep *) gf180mcu_fd_io__dvss pad_w_4 (/*.DVSS(dvss__pad[12])*/);
(* keep *) gf180mcu_fd_io__dvdd pad_w_3 (/*.DVDD(dvdd__pad[7])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_w_2 (/*.ASIG5V(asig_5p0__pad[16])*/);
(* keep *) gf180mcu_fd_io__asig_5p0 pad_w_1 (/*.ASIG5V(asig_5p0__pad[17])*/);
(* keep *) gf180mcu_fd_io__dvss pad_w_0 (/*.DVSS(dvss__pad[13])*/);

endmodule
