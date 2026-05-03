`timescale 1ns / 1ps

module counter(
    input clk, rst,
    input btn,
    output reg [3:0] data_out
);

always @(posedge clk or negedge rst) begin
    if (!rst) data_out <= 4'b0;
    else if (btn) data_out <= data_out + 1;
end

endmodule
