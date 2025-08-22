`default_nettype none

module tt_um_pad_test (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n,    // reset_n - low to reset
    input  wire [3:0] pad_in,
    output wire [1:0] pad_out,
    output wire [3:0] pad_dir,
    output wire [17:0] pad_config
);

reg [17:0] cfg;
reg [4:0] index;

wire cycle_index = ui_in[6];
wire toggle_cfg = ui_in[7];

always @(posedge clk) begin
    if (!rst_n) begin
        cfg <= 18'b0;
        index <= 5'd0;
    end else if (cycle_index) begin
        if (index == 5'd17) begin
            index <= 5'd0;
        end else begin
            index <= index + 1;
        end
    end else if (toggle_cfg) begin
        cfg[index] <= ~cfg[index];
    end
end

reg [5:0] current_pin_cfg;

always_comb begin
    case (index)
        5'd0, 5'd1: current_pin_cfg = {4'b0, cfg[1:0]};
        5'd2, 5'd3: current_pin_cfg = {4'b0, cfg[3:2]};
        5'd4, 5'd5, 5'd6, 5'd7, 5'd8, 5'd9: current_pin_cfg = cfg[9:4];
        5'd10, 5'd11, 5'd12, 5'd13: current_pin_cfg = {2'b0, cfg[13:10]};
        5'd14, 5'd15, 5'd16, 5'd17: current_pin_cfg = {2'b0, cfg[17:14]};
        default: current_pin_cfg = 6'b0;
    endcase
end

assign pad_out[0] = ui_in[0];
assign pad_dir[1:0] = ui_in[2:1];
assign pad_out[1] = ui_in[3];
assign pad_dir[3:2] = ui_in[5:4];
assign pad_config = cfg;

assign uo_out[3:0] = pad_in;
assign uo_out[4] = cfg[index];
assign uo_out[7:5] = index[2:0];
assign uio_out[1:0] = index[4:3];
assign uio_out[7:2] = current_pin_cfg;
assign uio_oe = 8'b11111111;

wire _unused = &{ena, 1'b0};

endmodule
