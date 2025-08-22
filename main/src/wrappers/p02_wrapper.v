`default_nettype none

module p02_wrapper (
  input wire ena,
  input wire [17:0] iw,
  output wire [23:0] ow,
  input wire [3:0] pad_in,
  output wire [1:0] pad_out,
  output wire [3:0] pad_dir,
  output wire [17:0] pad_config
);

wire [7:0] uio_in;
wire [7:0] uio_out;
wire [7:0] uio_oe;
wire [7:0] uo_out;
wire [7:0] ui_in;
wire clk;
wire rst_n;

assign { uio_in, ui_in, rst_n, clk } = iw;
assign ow = { uio_oe, uio_out, uo_out };

tt_um_pad_test tt_um_I (
  .uio_in  (uio_in),
  .uio_out (uio_out),
  .uio_oe  (uio_oe),
  .uo_out  (uo_out),
  .ui_in   (ui_in),
  .ena     (ena),
  .clk     (clk),
  .rst_n   (rst_n),
  .pad_in,
  .pad_out,
  .pad_dir,
  .pad_config
);

endmodule
