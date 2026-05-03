`timescale 1ns / 1ps
// 시뮬레이션 시간 단위 지정
// 1ns : 시뮬레이션에서 #10은 10ns를 의미
// 1ps : 시간 정밀도는 1ps

module button_counter(
    input wire clk,
    input wire rst,
    input wire btn,
    output reg [3:0] data_out
);


reg prev_btn; // 이전 클럭에서의 버튼 상태 저장

// 버튼이 0->1로 바뀐 순간만 감지
// 따라서 버튼을 계속 누르고 있어도 카운터는 계속 증가하지 않음
wire posedge_btn; // 버튼이 새로 눌린 순간을 나타내는 신호
assign posedge_btn = (btn == 1'b1) && (prev_btn == 1'b0);


always @(posedge clk or negedge rst) begin
    // 리셋 버튼 active-low
    if (!rst) begin
        prev_btn <= 1'b0;
        data_out <= 4'b0;
    end
    else begin
        prev_btn <= btn;
        
        // 버튼이 새로 눌린 순간이면 카운터 1 증가
        if (posedge_btn) begin
            data_out <= data_out + 1;
        end
    end
end

endmodule
