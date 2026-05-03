`timescale 1ns / 1ps

// 테스트벤치는 보통 입출력 포트가 없음
// 외부에서 신호를 받는 회로가 아닌, 내부에서 테스트 신호를 직접 만들기 때문
module tb_button_counter;

// 테스트용 신호 선언
// 입력으로 줄 신호들은 reg로 선언
// 출력으로 관찰할 신호는 wire로 선언
reg clk;
reg rst;
reg btn;
wire [3:0] data_out;

// 클럭 주기 설정
// 1 / 10ns = 100MHz (Nexys4 DDR 보드와 동일)
parameter CLK_PERIOD = 10;

// DUT(Design Under Test) 인스턴스 생성
// 테스트할 대상 회로라는 뜻
button_counter u_button_counter(
    .clk(clk),
    .rst(rst),
    .btn(btn),
    .data_out(data_out)
);

// 100MHz 클럭 생성
// 5ns마다 클럭을 반전함
initial begin
    clk = 0;
    forever #(CLK_PERIOD / 2) clk = ~clk;
end


// 입력 시나리오 
initial begin
    // 1. Initial Reset
    rst = 1'b0;
    btn = 1'b0;
    #20;
    // 2. Release Reset
    rst = 1'b1;
    #20;
    // 3. First Posedge (Count to 1)
    btn = 1'b1;
    #10; 
    // 4. Release and Hold
    btn = 1'b0;
    #40;
    // 5. Second Posedge (Count to 2)
    btn = 1'b1;
    #10; 
    // 6. Third Posedge (Count to 3)
    btn = 1'b0;
    #20;
    btn = 1'b1;
    #10; 
    $finish;
end


endmodule
