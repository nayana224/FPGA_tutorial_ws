`timescale 1ns / 1ps

module display_segment(
    input wire clk, // 100MHz 시스템 클럭
    input wire rst, // reset 입력, SW15에 연결
    input wire btn, // 버튼 입력, BTNC
    output [6:0] cathode, // 7-segment의 CA~CG 제어
    output [7:0] anode, // 8개 자리 선택
    output [3:0] data_out // LED 확인용 카운터 값
);

wire [3:0] data;


button_counter u_button_counter(
    .clk(clk),
    .rst(rst),
    .btn(btn),
    .data_out(data)
);

segment u_segment(
    .data(data),
    .cathode(cathode)
);

// AN과 CA~CG 모두 active-low
assign anode = 8'b1111_1110; // 첫 번째 자리만 ON (나머지 사용 안 함)
assign data_out = data;

endmodule
