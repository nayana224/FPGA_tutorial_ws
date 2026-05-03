`timescale 1ns / 1ps

module segment_control(
    input  wire clk, rst,
    input  wire btn_u, btn_d, btn_l, btn_r, 
    output wire [31:0] display_data         
);
    reg [3:0] digit_array [7:0]; // 7-segment 8자리의 값을 저장함
    reg [2:0] curr_digit; // 현재 수정 중인 자리
    reg [3:0] btn_prev;
    wire [3:0] btn_posedge;
    

    assign btn_posedge = {btn_u, btn_d, btn_l, btn_r} & ~btn_prev;
    //    ex)
    //    btn_posedge[3] = btn_u
    //    btn_posedge[2] = btn_d
    //    btn_posedge[1] = btn_l
    //    btn_posedge[0] = btn_r

 always @(posedge clk or negedge rst) begin
        if (!rst) begin
            btn_prev   <= 4'b0;
            curr_digit <= 3'd0;
            digit_array[0] <= 4'h0; digit_array[1] <= 4'h0; digit_array[2] <= 4'h0; digit_array[3] <= 4'h0;
            digit_array[4] <= 4'h0; digit_array[5] <= 4'h0; digit_array[6] <= 4'h0; digit_array[7] <= 4'h0;
        end 
 else begin
            btn_prev <= {btn_u, btn_d, btn_l, btn_r};

            if (btn_posedge[1])      curr_digit <= curr_digit + 1; // Left (AN0 -> AN1)
            else if (btn_posedge[0]) curr_digit <= curr_digit - 1; // Right (AN1 -> AN0)

            // 상/하 버튼: 현재 선택된 자리의 값 변경
            if (btn_posedge[3])      digit_array[curr_digit] <= digit_array[curr_digit] + 1; // Up
            else if (btn_posedge[2]) digit_array[curr_digit] <= digit_array[curr_digit] - 1; // Down
        end
    end

    assign display_data = {digit_array[7], digit_array[6], digit_array[5], digit_array[4],
                           digit_array[3], digit_array[2], digit_array[1], digit_array[0]};
endmodule
