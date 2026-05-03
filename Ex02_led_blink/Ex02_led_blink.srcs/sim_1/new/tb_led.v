`timescale 1ns / 1ps

module tb_led;

// input
reg btn;

// output
wire led;

led u_led(
    .btn(btn),
    .led(led)
);

initial begin
    // Initial state: button not pressed
    btn = 1'b0;
    #100;

    // Press button
    btn = 1'b1;
    #100;

    // Release button
    btn = 1'b0;
    #100;

    // Press button again
    btn = 1'b1;
    #100;

    // Release button
    btn = 1'b0;
    #100;

    $finish;
end

endmodule