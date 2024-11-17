`timescale 1ns / 1ps

module tb_mux_8to1;
    // Testbench signals
    reg [7:0] data_in; // 8 input data signals
    reg [2:0] sel;     // 3-bit selection input
    wire data_out;     // Output of the MUX

    // Instantiate the mux_8to1 module
    mux_8to1 uut (
        .data_in(data_in),
        .sel(sel),
        .data_out(data_out)
    );

    // Test vector generation
    initial begin
        // Initialize data_in to test various combinations
        data_in = 8'b10101010; // Example data inputs

        // Apply all possible selections
        sel = 3'b000; #10; // Select input 0
        $monitor("sel: %b | data_out: %b (expected: %b)", sel, data_out, data_in[0]);

        sel = 3'b001; #10; // Select input 1
        $monitor("sel: %b | data_out: %b (expected: %b)", sel, data_out, data_in[1]);

        sel = 3'b010; #10; // Select input 2
        $monitor("sel: %b | data_out: %b (expected: %b)", sel, data_out, data_in[2]);

        sel = 3'b011; #10; // Select input 3
        $monitor("sel: %b | data_out: %b (expected: %b)", sel, data_out, data_in[3]);

        sel = 3'b100; #10; // Select input 4
        $monitor("sel: %b | data_out: %b (expected: %b)", sel, data_out, data_in[4]);

        sel = 3'b101; #10; // Select input 5
        $monitor("sel: %b | data_out: %b (expected: %b)", sel, data_out, data_in[5]);

        sel = 3'b110; #10; // Select input 6
        $monitor("sel: %b | data_out: %b (expected: %b)", sel, data_out, data_in[6]);

        sel = 3'b111; #10; // Select input 7
        $monitor("sel: %b | data_out: %b (expected: %b)", sel, data_out, data_in[7]);

        // Finish simulation
        #10;
        $finish;
    end
endmodule

