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

wire _unused = &{pad_in, iw, 'b0};
assign ow = 24'b0;
assign pad_out = 2'b0;
assign pad_dir = 4'b0;
assign pad_config = 18'b0;

endmodule
