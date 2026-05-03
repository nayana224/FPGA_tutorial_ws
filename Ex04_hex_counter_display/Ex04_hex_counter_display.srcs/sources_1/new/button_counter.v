`timescale 1ns / 1ps

module button_counter(
    input wire clk,
    input wire rst,
    input wire btn,
    output reg [3:0] data_out
);
// 내부 상태 저장용 변수
reg prev_btn;
wire posedge_btn; 

always @(posedge clk or negedge rst) begin
    // reset 버튼 active-low
    if (!rst) begin
        prev_btn <= 1'b0;
        data_out <= 4'b0;
    end
    // 버튼을 위로 올려야 카운터 동작
    else begin
        prev_btn <= btn;
        
        // 버튼이 0->1로 바뀌는 순간만 카운터 증가
        if (posedge_btn) begin
            data_out <= data_out + 1;
        end
    end
end

assign posedge_btn = (btn == 1'b1) && (prev_btn == 1'b0);

endmodule




