`timescale 1ns / 1ps

module segments(
    input  wire clk, rst,
    input  wire [31:0] display_data,
    output wire [6:0] cathode,
    output reg  [7:0] anode
);
    reg [16:0] clk_div; 
    reg [2:0]  sel;    
    wire [3:0] current_hex;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            clk_div <= 17'd0;
            sel     <= 3'd0;
        end 
 else begin
            if (clk_div >= 125000 - 1) begin
                clk_div <= 17'd0;
                sel     <= sel + 1;
            end else clk_div <= clk_div + 1;
        end
    end
    always @(*) begin
        anode = 8'b1111_1111;
        anode[sel] = 1'b0;
    end
    assign current_hex = display_data[sel*4 +: 4]; // 비트 슬라이싱
 decoder_7seg u_decoder (
        .data(current_hex),
        .cathode(cathode)
    );

endmodule




