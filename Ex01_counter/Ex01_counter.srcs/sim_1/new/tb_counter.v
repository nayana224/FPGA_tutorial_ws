`timescale 1ns / 1ps

module tb_counter; 

reg clk, rst;
reg btn;
wire [3:0] data_out; 

counter u_counter(
    .clk(clk),
    .rst(rst),
    .btn(btn),
    .data_out(data_out)
);

initial begin
    clk = 0;
end

always #5 clk <= ~clk;

initial begin
    rst = 0;
    #30 rst = 1;
end

initial begin
    btn = 0;
    #43 btn = 1;
    #60 btn = 0;
    #80 btn = 1;
    #120 $finish;
end
endmodule
