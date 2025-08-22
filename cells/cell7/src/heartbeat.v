`default_nettype none

module heartbeat_7 (
`ifdef USE_POWER_PINS
    inout wire VSS,
    inout wire VDD,
`endif
    input wire clk,
    output reg signal
);

reg [7:0] counter;
reg [2:0] index;
reg manchester;

always @(posedge clk) begin
    signal <= counter[index] ^ manchester;
    manchester <= !manchester;
    if (manchester) begin
        index <= index - 1;
        if (index == 0) begin
            counter <= counter + 1;
        end
    end
end

endmodule
