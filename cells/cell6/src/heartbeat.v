`default_nettype none

`define INVERTER_CHAIN_LENGTH 1024

module heartbeat_6 (
`ifdef USE_POWER_PINS
    inout wire VSS,
    inout wire VDD,
`endif
    input wire clk,
    output wire signal
);

reg [7:0] counter;
reg [2:0] index;
reg manchester;
wire manchester_delayed;

`ifdef COCOTB_SIM

assign manchester_delayed = manchester;

`else

wire [`INVERTER_CHAIN_LENGTH:0] inverter_chain;
assign inverter_chain[0] = !manchester;
assign manchester_delayed = !inverter_chain[`INVERTER_CHAIN_LENGTH];

genvar i;
generate
    for (i=0; i<`INVERTER_CHAIN_LENGTH; i=i+1) begin
        inverter i_inv(
            .a(inverter_chain[i]),
            .y(inverter_chain[i+1])
        );
    end
endgenerate

`endif

always @(posedge clk) begin
    manchester <= !manchester_delayed;
    if (manchester) begin
        index <= index - 1;
        if (index == 0) begin
            counter <= counter + 1;
        end
    end
end

assign signal = counter[index] ^ manchester_delayed;

endmodule
