`default_nettype none

module inverter (
    input wire a,
    output wire y
);

`ifdef SCL_sky130_fd_sc_hd
(* keep *)
sky130_fd_sc_hd__inv_1 i_inv (
    .A(a),
    .Y(y)
);
`endif

`ifdef SCL_sg13g2_stdcell
(* keep *)
sg13g2_inv_1 i_inv (
    .A(a),
    .Y(y)
);
`endif

`ifdef SCL_gf180mcu_fd_sc_mcu7t5v0
(* keep *)
gf180mcu_fd_sc_mcu7t5v0__inv_1 i_inv (
    .I(a),
    .ZN(y)
);
`endif

`ifdef SCL_gf180mcu_fd_sc_mcu9t5v0
(* keep *)
gf180mcu_fd_sc_mcu9t5v0__inv_1 i_inv (
    .I(a),
    .ZN(y)
);
`endif

`ifdef SCL_gf180mcu_osu_sc_gp9t3v3
(* keep *)
gf180mcu_osu_sc_gp9t3v3__inv_1 i_inv (
    .A(a),
    .Y(y)
);
`endif

`ifdef SCL_gf180mcu_osu_sc_gp12t3v3
(* keep *)
gf180mcu_osu_sc_gp12t3v3__inv_1 i_inv (
    .A(a),
    .Y(y)
);
`endif

`ifdef SCL_gf180mcu_as_sc_mcu7t3v3
(* keep *)
gf180mcu_as_sc_mcu7t3v3__inv_2 i_inv (
    .A(a),
    .Y(y)
);
`endif

endmodule
