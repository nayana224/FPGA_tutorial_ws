`timescale 1ns / 1ps

module segment_top(
    input  wire clk, rst,
    input  wire btn_u, btn_d, btn_l, btn_r,
    output wire [6:0] cathode,
    output wire [7:0] anode
);
    wire [31:0] shared_data;

    segment_control u_ctrl (
        .clk(clk), .rst(rst),
        .btn_u(btn_u), .btn_d(btn_d),
        .btn_l(btn_l), .btn_r(btn_r),
        .display_data(shared_data)
    );
 segments u_disp (
        .clk(clk), .rst(rst),
        .display_data(shared_data),
        .cathode(cathode),
        .anode(anode)
    );

endmodule










