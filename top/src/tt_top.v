`default_nettype none

module tt_top (
`ifdef CONNECT_POWER_PADS
    inout wire vss,
    inout wire vddio0,
    inout wire vddio1,
    inout wire vddio2,
    inout wire vddio3,
    inout wire vddio4,
    inout wire vddcore0,
    inout wire vddcore1,
    inout wire vddcore2,
    inout wire vddcore3,
    inout wire vddcore4,
`endif
`ifdef CONNECT_ANALOG_PADS
    inout wire loop1,
    inout wire loop2,
    inout wire tie,
    inout wire ta,
    inout wire toe,
    inout wire ty,
`endif
    inout wire [49:0] digital_pad
);


wire [7:0] hclk_Y;
wire [7:0] hclk_PD;
wire [7:0] hclk_PU;
wire [7:0] hsig_Y;
wire [7:0] hsig_A;
wire [7:0] hsig_OE;
wire [7:0] hsig_IE;
wire [7:0] hsig_SL;
wire [7:0] hsig_CS;
wire [7:0] hsig_PD;
wire [7:0] hsig_PU;

wire tt_clk_Y;
wire tt_clk_PD;
wire tt_clk_PU;
wire [11:0] tt_in_Y;
wire [11:0] tt_in_PD;
wire [11:0] tt_in_PU;
wire [15:0] tt_bi_Y;
wire [15:0] tt_bi_A;
wire [15:0] tt_bi_OE;
wire [15:0] tt_bi_IE;
wire [15:0] tt_bi_SL;
wire [15:0] tt_bi_CS;
wire [15:0] tt_bi_PD;
wire [15:0] tt_bi_PU;

wire [1:0] pt_in_Y;
wire [1:0] pt_in_PD;
wire [1:0] pt_in_PU;
wire [1:0] pt_bi_Y;
wire [1:0] pt_bi_A;
wire [1:0] pt_bi_OE;
wire [1:0] pt_bi_IE;
wire pt_bi_PDRV1;
wire pt_bi_PDRV0;
wire [2:0] pt_bi_SL;
wire [2:0] pt_bi_CS;
wire [2:0] pt_bi_PD;
wire [2:0] pt_bi_PU;


tt_main_macro main_inst (
`ifdef USE_POWER_PINS
    .VSS(vss),
    .VDD(vddcore0),
`endif
    .tt_clk_Y,
    .tt_clk_PD,
    .tt_clk_PU,
    .tt_in_Y,
    .tt_in_PD,
    .tt_in_PU,
    .tt_bi_Y,
    .tt_bi_A,
    .tt_bi_OE,
    .tt_bi_IE,
    .tt_bi_SL,
    .tt_bi_CS,
    .tt_bi_PD,
    .tt_bi_PU,
    .pt_in_Y,
    .pt_in_PD,
    .pt_in_PU,
    .pt_bi_Y,
    .pt_bi_A,
    .pt_bi_OE,
    .pt_bi_IE,
    .pt_bi_PDRV1,
    .pt_bi_PDRV0,
    .pt_bi_SL,
    .pt_bi_CS,
    .pt_bi_PD,
    .pt_bi_PU
);

tt_cell_macro_0 cell_inst_0 (
`ifdef USE_POWER_PINS
    .VSS(vss),
    .VDD(vddcore1),
`endif
    .hclk_Y(hclk_Y[0]),
    .hclk_PD(hclk_PD[0]),
    .hclk_PU(hclk_PU[0]),
    .hsig_Y(hsig_Y[0]),
    .hsig_A(hsig_A[0]),
    .hsig_OE(hsig_OE[0]),
    .hsig_IE(hsig_IE[0]),
    .hsig_SL(hsig_SL[0]),
    .hsig_CS(hsig_CS[0]),
    .hsig_PD(hsig_PD[0]),
    .hsig_PU(hsig_PU[0])
);

tt_cell_macro_1 cell_inst_1 (
`ifdef USE_POWER_PINS
    .VSS(vss),
    .VDD(vddcore1),
`endif
    .hclk_Y(hclk_Y[1]),
    .hclk_PD(hclk_PD[1]),
    .hclk_PU(hclk_PU[1]),
    .hsig_Y(hsig_Y[1]),
    .hsig_A(hsig_A[1]),
    .hsig_OE(hsig_OE[1]),
    .hsig_IE(hsig_IE[1]),
    .hsig_SL(hsig_SL[1]),
    .hsig_CS(hsig_CS[1]),
    .hsig_PD(hsig_PD[1]),
    .hsig_PU(hsig_PU[1])
);

tt_cell_macro_2 cell_inst_2 (
`ifdef USE_POWER_PINS
    .VSS(vss),
    .VDD(vddcore2),
`endif
    .hclk_Y(hclk_Y[2]),
    .hclk_PD(hclk_PD[2]),
    .hclk_PU(hclk_PU[2]),
    .hsig_Y(hsig_Y[2]),
    .hsig_A(hsig_A[2]),
    .hsig_OE(hsig_OE[2]),
    .hsig_IE(hsig_IE[2]),
    .hsig_SL(hsig_SL[2]),
    .hsig_CS(hsig_CS[2]),
    .hsig_PD(hsig_PD[2]),
    .hsig_PU(hsig_PU[2])
);

tt_cell_macro_3 cell_inst_3 (
`ifdef USE_POWER_PINS
    .VSS(vss),
    .VDD(vddcore2),
`endif
    .hclk_Y(hclk_Y[3]),
    .hclk_PD(hclk_PD[3]),
    .hclk_PU(hclk_PU[3]),
    .hsig_Y(hsig_Y[3]),
    .hsig_A(hsig_A[3]),
    .hsig_OE(hsig_OE[3]),
    .hsig_IE(hsig_IE[3]),
    .hsig_SL(hsig_SL[3]),
    .hsig_CS(hsig_CS[3]),
    .hsig_PD(hsig_PD[3]),
    .hsig_PU(hsig_PU[3])
);

tt_cell_macro_4 cell_inst_4 (
`ifdef USE_POWER_PINS
    .VSS(vss),
    .VDD(vddcore3),
`endif
    .hclk_Y(hclk_Y[4]),
    .hclk_PD(hclk_PD[4]),
    .hclk_PU(hclk_PU[4]),
    .hsig_Y(hsig_Y[4]),
    .hsig_A(hsig_A[4]),
    .hsig_OE(hsig_OE[4]),
    .hsig_IE(hsig_IE[4]),
    .hsig_SL(hsig_SL[4]),
    .hsig_CS(hsig_CS[4]),
    .hsig_PD(hsig_PD[4]),
    .hsig_PU(hsig_PU[4])
);

tt_cell_macro_5 cell_inst_5 (
`ifdef USE_POWER_PINS
    .VSS(vss),
    .VDD(vddcore3),
`endif
    .hclk_Y(hclk_Y[5]),
    .hclk_PD(hclk_PD[5]),
    .hclk_PU(hclk_PU[5]),
    .hsig_Y(hsig_Y[5]),
    .hsig_A(hsig_A[5]),
    .hsig_OE(hsig_OE[5]),
    .hsig_IE(hsig_IE[5]),
    .hsig_SL(hsig_SL[5]),
    .hsig_CS(hsig_CS[5]),
    .hsig_PD(hsig_PD[5]),
    .hsig_PU(hsig_PU[5])
);

tt_cell_macro_6 cell_inst_6 (
`ifdef USE_POWER_PINS
    .VSS(vss),
    .VDD(vddcore4),
`endif
    .hclk_Y(hclk_Y[6]),
    .hclk_PD(hclk_PD[6]),
    .hclk_PU(hclk_PU[6]),
    .hsig_Y(hsig_Y[6]),
    .hsig_A(hsig_A[6]),
    .hsig_OE(hsig_OE[6]),
    .hsig_IE(hsig_IE[6]),
    .hsig_SL(hsig_SL[6]),
    .hsig_CS(hsig_CS[6]),
    .hsig_PD(hsig_PD[6]),
    .hsig_PU(hsig_PU[6])
);

tt_cell_macro_7 cell_inst_7 (
`ifdef USE_POWER_PINS
    .VSS(vss),
    .VDD(vddcore4),
`endif
    .hclk_Y(hclk_Y[7]),
    .hclk_PD(hclk_PD[7]),
    .hclk_PU(hclk_PU[7]),
    .hsig_Y(hsig_Y[7]),
    .hsig_A(hsig_A[7]),
    .hsig_OE(hsig_OE[7]),
    .hsig_IE(hsig_IE[7]),
    .hsig_SL(hsig_SL[7]),
    .hsig_CS(hsig_CS[7]),
    .hsig_PD(hsig_PD[7]),
    .hsig_PU(hsig_PU[7])
);

loopback loop_inst (
`ifdef CONNECT_ANALOG_PADS
    .A(loop1),
    .B(loop2)
`else
    .A(),
    .B()
`endif
);

(* keep *)
tt_logo logo_inst (
);

wiring wiring_inst (
    .vss_pad_s_2(vss),
    .vss_pad_s_4(vss),
    .vddcore0_pad_s_5(vddcore0),
    .vss_pad_s_16(vss),
    .vss_pad_s_18(vss),
    .vddcore3_pad_s_19(vddcore3),
    .vss_pad_e_2(vss),
    .vss_pad_e_4(vss),
    .vddcore0_pad_e_5(vddcore0),
    .vss_pad_e_16(vss),
    .vss_pad_e_18(vss),
    .vddcore4_pad_e_19(vddcore4),
    .vss_pad_n_2(vss),
    .vss_pad_n_4(vss),
    .vddcore0_pad_n_5(vddcore0),
    .vss_pad_n_16(vss),
    .vss_pad_n_18(vss),
    .vddcore1_pad_n_19(vddcore1),
    .vss_pad_w_2(vss),
    .vss_pad_w_4(vss),
    .vddcore0_pad_w_5(vddcore0),
    .vss_pad_w_16(vss),
    .vss_pad_w_18(vss),
    .vddcore2_pad_w_19(vddcore2),
    .loop_pad_s_6(loop1),
    .loop_pad_s_7(loop2),
    .tie_pad_n_12(tie),
    .ta_pad_n_13(ta),
    .toe_pad_n_14(toe),
    .ty_pad_n_15(ty)
);


// IO_WEST
(* keep *) gf180mcu_fd_io__bi_24t   pad_w_0     (.PAD(digital_pad[ 0]), .Y(hsig_Y[1]), .A(hsig_A[1]), .OE(hsig_OE[1]), .IE(hsig_IE[1]), .SL(hsig_SL[1]), .CS(hsig_CS[1]), .PD(hsig_PD[1]), .PU(hsig_PU[1]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_1     (.PAD(digital_pad[ 1]), .Y(hclk_Y[1]), .PD(hclk_PD[1]), .PU(hclk_PU[1]));
`ifdef CONNECT_POWER_PADS
(* keep *) gf180mcu_ht_io_fix__dvss     pad_w_2    (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_w_3    (.DVDD(vddio1));
(* keep *) gf180mcu_ht_io_fix__dvss     pad_w_4    (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_w_5    (.DVDD(vddcore0));
`else
(* keep *) gf180mcu_ht_io_fix__dvss     pad_w_2    ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_w_3    ();
(* keep *) gf180mcu_ht_io_fix__dvss     pad_w_4    ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_w_5    ();
`endif
(* keep *) gf180mcu_fd_io__in_c     pad_w_6     (.PAD(digital_pad[ 2]), .Y(tt_clk_Y), .PD(tt_clk_PD), .PU(tt_clk_PU));
(* keep *) gf180mcu_fd_io__in_c     pad_w_7     (.PAD(digital_pad[ 3]), .Y(tt_in_Y[ 0]), .PD(tt_in_PD[ 0]), .PU(tt_in_PU[ 0]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_8     (.PAD(digital_pad[ 4]), .Y(tt_in_Y[ 1]), .PD(tt_in_PD[ 1]), .PU(tt_in_PU[ 1]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_9     (.PAD(digital_pad[ 5]), .Y(tt_in_Y[ 2]), .PD(tt_in_PD[ 2]), .PU(tt_in_PU[ 2]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_10    (.PAD(digital_pad[ 6]), .Y(tt_in_Y[ 3]), .PD(tt_in_PD[ 3]), .PU(tt_in_PU[ 3]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_11    (.PAD(digital_pad[ 7]), .Y(tt_in_Y[ 4]), .PD(tt_in_PD[ 4]), .PU(tt_in_PU[ 4]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_12    (.PAD(digital_pad[ 8]), .Y(tt_in_Y[ 5]), .PD(tt_in_PD[ 5]), .PU(tt_in_PU[ 5]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_13    (.PAD(digital_pad[ 9]), .Y(tt_in_Y[ 6]), .PD(tt_in_PD[ 6]), .PU(tt_in_PU[ 6]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_14    (.PAD(digital_pad[10]), .Y(tt_in_Y[ 7]), .PD(tt_in_PD[ 7]), .PU(tt_in_PU[ 7]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_15    (.PAD(digital_pad[11]), .Y(tt_in_Y[ 8]), .PD(tt_in_PD[ 8]), .PU(tt_in_PU[ 8]));
`ifdef CONNECT_POWER_PADS
(* keep *) gf180mcu_ht_io_fix__dvss     pad_w_16   (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_w_17   (.DVDD(vddio0));
(* keep *) gf180mcu_ht_io_fix__dvss     pad_w_18   (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_w_19   (.DVDD(vddcore2));
`else
(* keep *) gf180mcu_ht_io_fix__dvss     pad_w_16   ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_w_17   ();
(* keep *) gf180mcu_ht_io_fix__dvss     pad_w_18   ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_w_19   ();
`endif
(* keep *) gf180mcu_fd_io__bi_24t   pad_w_20    (.PAD(digital_pad[12]), .Y(hsig_Y[2]), .A(hsig_A[2]), .OE(hsig_OE[2]), .IE(hsig_IE[2]), .SL(hsig_SL[2]), .CS(hsig_CS[2]), .PD(hsig_PD[2]), .PU(hsig_PU[2]));
(* keep *) gf180mcu_fd_io__in_c     pad_w_21    (.PAD(digital_pad[13]), .Y(hclk_Y[2]), .PD(hclk_PD[2]), .PU(hclk_PU[2]));

// IO_SOUTH
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_0     (.PAD(digital_pad[14]), .Y(hsig_Y[3]), .A(hsig_A[3]), .OE(hsig_OE[3]), .IE(hsig_IE[3]), .SL(hsig_SL[3]), .CS(hsig_CS[3]), .PD(hsig_PD[3]), .PU(hsig_PU[3]));
(* keep *) gf180mcu_fd_io__in_c     pad_s_1     (.PAD(digital_pad[15]), .Y(hclk_Y[3]), .PD(hclk_PD[3]), .PU(hclk_PU[3]));
`ifdef CONNECT_POWER_PADS
(* keep *) gf180mcu_ht_io_fix__dvss     pad_s_2    (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_s_3    (.DVDD(vddio2));
(* keep *) gf180mcu_ht_io_fix__dvss     pad_s_4    (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_s_5    (.DVDD(vddcore0));
`else
(* keep *) gf180mcu_ht_io_fix__dvss     pad_s_2    ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_s_3    ();
(* keep *) gf180mcu_ht_io_fix__dvss     pad_s_4    ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_s_5    ();
`endif
`ifdef CONNECT_ANALOG_PADS
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_s_6  (.ASIG5V(loop1));
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_s_7  (.ASIG5V(loop2));
`else
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_s_6  ();
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_s_7  ();
`endif
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_8     (.PAD(digital_pad[16]), .Y(tt_bi_Y[ 0]), .A(tt_bi_A[ 0]), .OE(tt_bi_OE[ 0]), .IE(tt_bi_IE[ 0]), .SL(tt_bi_SL[ 0]), .CS(tt_bi_CS[ 0]), .PD(tt_bi_PD[ 0]), .PU(tt_bi_PU[ 0]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_9     (.PAD(digital_pad[17]), .Y(tt_bi_Y[ 1]), .A(tt_bi_A[ 1]), .OE(tt_bi_OE[ 1]), .IE(tt_bi_IE[ 1]), .SL(tt_bi_SL[ 1]), .CS(tt_bi_CS[ 1]), .PD(tt_bi_PD[ 1]), .PU(tt_bi_PU[ 1]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_10    (.PAD(digital_pad[18]), .Y(tt_bi_Y[ 2]), .A(tt_bi_A[ 2]), .OE(tt_bi_OE[ 2]), .IE(tt_bi_IE[ 2]), .SL(tt_bi_SL[ 2]), .CS(tt_bi_CS[ 2]), .PD(tt_bi_PD[ 2]), .PU(tt_bi_PU[ 2]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_11    (.PAD(digital_pad[19]), .Y(tt_bi_Y[ 3]), .A(tt_bi_A[ 3]), .OE(tt_bi_OE[ 3]), .IE(tt_bi_IE[ 3]), .SL(tt_bi_SL[ 3]), .CS(tt_bi_CS[ 3]), .PD(tt_bi_PD[ 3]), .PU(tt_bi_PU[ 3]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_12    (.PAD(digital_pad[20]), .Y(tt_bi_Y[ 4]), .A(tt_bi_A[ 4]), .OE(tt_bi_OE[ 4]), .IE(tt_bi_IE[ 4]), .SL(tt_bi_SL[ 4]), .CS(tt_bi_CS[ 4]), .PD(tt_bi_PD[ 4]), .PU(tt_bi_PU[ 4]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_13    (.PAD(digital_pad[21]), .Y(tt_bi_Y[ 5]), .A(tt_bi_A[ 5]), .OE(tt_bi_OE[ 5]), .IE(tt_bi_IE[ 5]), .SL(tt_bi_SL[ 5]), .CS(tt_bi_CS[ 5]), .PD(tt_bi_PD[ 5]), .PU(tt_bi_PU[ 5]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_14    (.PAD(digital_pad[22]), .Y(tt_bi_Y[ 6]), .A(tt_bi_A[ 6]), .OE(tt_bi_OE[ 6]), .IE(tt_bi_IE[ 6]), .SL(tt_bi_SL[ 6]), .CS(tt_bi_CS[ 6]), .PD(tt_bi_PD[ 6]), .PU(tt_bi_PU[ 6]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_15    (.PAD(digital_pad[23]), .Y(tt_bi_Y[ 7]), .A(tt_bi_A[ 7]), .OE(tt_bi_OE[ 7]), .IE(tt_bi_IE[ 7]), .SL(tt_bi_SL[ 7]), .CS(tt_bi_CS[ 7]), .PD(tt_bi_PD[ 7]), .PU(tt_bi_PU[ 7]));
`ifdef CONNECT_POWER_PADS
(* keep *) gf180mcu_ht_io_fix__dvss     pad_s_16   (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_s_17   (.DVDD(vddio0));
(* keep *) gf180mcu_ht_io_fix__dvss     pad_s_18   (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_s_19   (.DVDD(vddcore3));
`else
(* keep *) gf180mcu_ht_io_fix__dvss     pad_s_16   ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_s_17   ();
(* keep *) gf180mcu_ht_io_fix__dvss     pad_s_18   ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_s_19   ();
`endif
(* keep *) gf180mcu_fd_io__bi_24t   pad_s_20    (.PAD(digital_pad[24]), .Y(hsig_Y[4]), .A(hsig_A[4]), .OE(hsig_OE[4]), .IE(hsig_IE[4]), .SL(hsig_SL[4]), .CS(hsig_CS[4]), .PD(hsig_PD[4]), .PU(hsig_PU[4]));
(* keep *) gf180mcu_fd_io__in_c     pad_s_21    (.PAD(digital_pad[25]), .Y(hclk_Y[4]), .PD(hclk_PD[4]), .PU(hclk_PU[4]));

// IO_EAST
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_0     (.PAD(digital_pad[26]), .Y(hsig_Y[5]), .A(hsig_A[5]), .OE(hsig_OE[5]), .IE(hsig_IE[5]), .SL(hsig_SL[5]), .CS(hsig_CS[5]), .PD(hsig_PD[5]), .PU(hsig_PU[5]));
(* keep *) gf180mcu_fd_io__in_c     pad_e_1     (.PAD(digital_pad[27]), .Y(hclk_Y[5]), .PD(hclk_PD[5]), .PU(hclk_PU[5]));
`ifdef CONNECT_POWER_PADS
(* keep *) gf180mcu_ht_io_fix__dvss     pad_e_2    (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_e_3    (.DVDD(vddio3));
(* keep *) gf180mcu_ht_io_fix__dvss     pad_e_4    (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_e_5    (.DVDD(vddcore0));
`else
(* keep *) gf180mcu_ht_io_fix__dvss     pad_e_2    ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_e_3    ();
(* keep *) gf180mcu_ht_io_fix__dvss     pad_e_4    ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_e_5    ();
`endif
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_6     (.PAD(digital_pad[28]), .Y(tt_bi_Y[ 8]), .A(tt_bi_A[ 8]), .OE(tt_bi_OE[ 8]), .IE(tt_bi_IE[ 8]), .SL(tt_bi_SL[ 8]), .CS(tt_bi_CS[ 8]), .PD(tt_bi_PD[ 8]), .PU(tt_bi_PU[ 8]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_7     (.PAD(digital_pad[29]), .Y(tt_bi_Y[ 9]), .A(tt_bi_A[ 9]), .OE(tt_bi_OE[ 9]), .IE(tt_bi_IE[ 9]), .SL(tt_bi_SL[ 9]), .CS(tt_bi_CS[ 9]), .PD(tt_bi_PD[ 9]), .PU(tt_bi_PU[ 9]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_8     (.PAD(digital_pad[30]), .Y(tt_bi_Y[10]), .A(tt_bi_A[10]), .OE(tt_bi_OE[10]), .IE(tt_bi_IE[10]), .SL(tt_bi_SL[10]), .CS(tt_bi_CS[10]), .PD(tt_bi_PD[10]), .PU(tt_bi_PU[10]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_9     (.PAD(digital_pad[31]), .Y(tt_bi_Y[11]), .A(tt_bi_A[11]), .OE(tt_bi_OE[11]), .IE(tt_bi_IE[11]), .SL(tt_bi_SL[11]), .CS(tt_bi_CS[11]), .PD(tt_bi_PD[11]), .PU(tt_bi_PU[11]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_10    (.PAD(digital_pad[32]), .Y(tt_bi_Y[12]), .A(tt_bi_A[12]), .OE(tt_bi_OE[12]), .IE(tt_bi_IE[12]), .SL(tt_bi_SL[12]), .CS(tt_bi_CS[12]), .PD(tt_bi_PD[12]), .PU(tt_bi_PU[12]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_11    (.PAD(digital_pad[33]), .Y(tt_bi_Y[13]), .A(tt_bi_A[13]), .OE(tt_bi_OE[13]), .IE(tt_bi_IE[13]), .SL(tt_bi_SL[13]), .CS(tt_bi_CS[13]), .PD(tt_bi_PD[13]), .PU(tt_bi_PU[13]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_12    (.PAD(digital_pad[34]), .Y(tt_bi_Y[14]), .A(tt_bi_A[14]), .OE(tt_bi_OE[14]), .IE(tt_bi_IE[14]), .SL(tt_bi_SL[14]), .CS(tt_bi_CS[14]), .PD(tt_bi_PD[14]), .PU(tt_bi_PU[14]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_13    (.PAD(digital_pad[35]), .Y(tt_bi_Y[15]), .A(tt_bi_A[15]), .OE(tt_bi_OE[15]), .IE(tt_bi_IE[15]), .SL(tt_bi_SL[15]), .CS(tt_bi_CS[15]), .PD(tt_bi_PD[15]), .PU(tt_bi_PU[15]));
(* keep *) gf180mcu_fd_io__in_c     pad_e_14    (.PAD(digital_pad[36]), .Y(tt_in_Y[ 9]), .PD(tt_in_PD[ 9]), .PU(tt_in_PU[ 9]));
(* keep *) gf180mcu_fd_io__in_c     pad_e_15    (.PAD(digital_pad[37]), .Y(tt_in_Y[10]), .PD(tt_in_PD[10]), .PU(tt_in_PU[10]));
`ifdef CONNECT_POWER_PADS
(* keep *) gf180mcu_ht_io_fix__dvss     pad_e_16   (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_e_17   (.DVDD(vddio0));
(* keep *) gf180mcu_ht_io_fix__dvss     pad_e_18   (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_e_19   (.DVDD(vddcore4));
`else
(* keep *) gf180mcu_ht_io_fix__dvss     pad_e_16   ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_e_17   ();
(* keep *) gf180mcu_ht_io_fix__dvss     pad_e_18   ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_e_19   ();
`endif
(* keep *) gf180mcu_fd_io__bi_24t   pad_e_20    (.PAD(digital_pad[38]), .Y(hsig_Y[6]), .A(hsig_A[6]), .OE(hsig_OE[6]), .IE(hsig_IE[6]), .SL(hsig_SL[6]), .CS(hsig_CS[6]), .PD(hsig_PD[6]), .PU(hsig_PU[6]));
(* keep *) gf180mcu_fd_io__in_c     pad_e_21    (.PAD(digital_pad[39]), .Y(hclk_Y[6]), .PD(hclk_PD[6]), .PU(hclk_PU[6]));

// IO_NORTH
(* keep *) gf180mcu_fd_io__bi_24t   pad_n_0     (.PAD(digital_pad[40]), .Y(hsig_Y[7]), .A(hsig_A[7]), .OE(hsig_OE[7]), .IE(hsig_IE[7]), .SL(hsig_SL[7]), .CS(hsig_CS[7]), .PD(hsig_PD[7]), .PU(hsig_PU[7]));
(* keep *) gf180mcu_fd_io__in_c     pad_n_1     (.PAD(digital_pad[41]), .Y(hclk_Y[7]), .PD(hclk_PD[7]), .PU(hclk_PU[7]));
`ifdef CONNECT_POWER_PADS
(* keep *) gf180mcu_ht_io_fix__dvss     pad_n_2    (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_n_3    (.DVDD(vddio4));
(* keep *) gf180mcu_ht_io_fix__dvss     pad_n_4    (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_n_5    (.DVDD(vddcore0));
`else
(* keep *) gf180mcu_ht_io_fix__dvss     pad_n_2    ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_n_3    ();
(* keep *) gf180mcu_ht_io_fix__dvss     pad_n_4    ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_n_5    ();
`endif
(* keep *) gf180mcu_fd_io__in_c     pad_n_6     (.PAD(digital_pad[42]), .Y(tt_in_Y[11]), .PD(tt_in_PD[11]), .PU(tt_in_PU[11]));
(* keep *) gf180mcu_fd_io__in_c     pad_n_7     (.PAD(digital_pad[43]), .Y(pt_in_Y[0]), .PD(pt_in_PD[0]), .PU(pt_in_PU[0]));
(* keep *) gf180mcu_fd_io__in_s     pad_n_8     (.PAD(digital_pad[44]), .Y(pt_in_Y[1]), .PD(pt_in_PD[1]), .PU(pt_in_PU[1]));
(* keep *) gf180mcu_fd_io__bi_t     pad_n_9     (.PAD(digital_pad[45]), .Y(pt_bi_Y[0]), .A(pt_bi_A[0]), .OE(pt_bi_OE[0]), .IE(pt_bi_IE[0]), .PDRV1(pt_bi_PDRV1), .PDRV0(pt_bi_PDRV0), .SL(pt_bi_SL[0]), .CS(pt_bi_CS[0]), .PD(pt_bi_PD[0]), .PU(pt_bi_PU[0]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_n_10    (.PAD(digital_pad[46]), .Y(pt_bi_Y[1]), .A(pt_bi_A[1]), .OE(pt_bi_OE[1]), .IE(pt_bi_IE[1]), .SL(pt_bi_SL[1]), .CS(pt_bi_CS[1]), .PD(pt_bi_PD[1]), .PU(pt_bi_PU[1]));
(* keep *) gf180mcu_fd_io__bi_24t   pad_n_11    (.PAD(digital_pad[47]), .Y(ty), .A(ta), .OE(toe), .IE(tie), .SL(pt_bi_SL[2]), .CS(pt_bi_CS[2]), .PD(pt_bi_PD[2]), .PU(pt_bi_PU[2]));
`ifdef CONNECT_ANALOG_PADS
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_n_12 (.ASIG5V(tie));
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_n_13 (.ASIG5V(ta));
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_n_14 (.ASIG5V(toe));
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_n_15 (.ASIG5V(ty));
`else
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_n_12 ();
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_n_13 ();
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_n_14 ();
(* keep *) gf180mcu_ht_io_fix__asig_5p0 pad_n_15 ();
`endif
`ifdef CONNECT_POWER_PADS
(* keep *) gf180mcu_ht_io_fix__dvss     pad_n_16   (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_n_17   (.DVDD(vddio0));
(* keep *) gf180mcu_ht_io_fix__dvss     pad_n_18   (.DVSS(vss));
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_n_19   (.DVDD(vddcore1));
`else
(* keep *) gf180mcu_ht_io_fix__dvss     pad_n_16   ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_n_17   ();
(* keep *) gf180mcu_ht_io_fix__dvss     pad_n_18   ();
(* keep *) gf180mcu_ht_io_fix__dvdd     pad_n_19   ();
`endif
(* keep *) gf180mcu_fd_io__bi_24t   pad_n_20    (.PAD(digital_pad[48]), .Y(hsig_Y[0]), .A(hsig_A[0]), .OE(hsig_OE[0]), .IE(hsig_IE[0]), .SL(hsig_SL[0]), .CS(hsig_CS[0]), .PD(hsig_PD[0]), .PU(hsig_PU[0]));
(* keep *) gf180mcu_fd_io__in_c     pad_n_21    (.PAD(digital_pad[49]), .Y(hclk_Y[0]), .PD(hclk_PD[0]), .PU(hclk_PU[0]));

endmodule
