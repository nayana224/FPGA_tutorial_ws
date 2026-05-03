`timescale 1ns / 1ps

module decoder_7seg(
    input  wire [3:0] data,
    output reg  [6:0] cathode // cathode[6] = {CA, CB, CC, CD, CE, CF, CG} 
);
always @(*) begin
    case(data)
        4'h0: cathode = 7'b0000001; // 0
        4'h1: cathode = 7'b1001111; // 1
        4'h2: cathode = 7'b0010010; // 2
        4'h3: cathode = 7'b0000110; // 3
        4'h4: cathode = 8'b1001100; // 4
        4'h5: cathode = 7'b0100100; // 5
        4'h6: cathode = 7'b0100000; // 6
        4'h7: cathode = 7'b0001111; // 7
        4'h8: cathode = 7'b0000000; // 8
        4'h9: cathode = 7'b0000100; // 9
        4'hA: cathode = 7'b0001000; // A
        4'hB: cathode = 7'b1100000; // B
        4'hC: cathode = 7'b0110001; // C
        4'hD: cathode = 7'b1000010; // D
        4'hE: cathode = 7'b0110000; // E
        4'hF: cathode = 7'b0111000; // F
        default: cathode = 7'b1111111;
    endcase
end

endmodule


