`timescale 1ns / 1ps

module odified_Fredkin_tb;
    // Testbench signals
    reg clk;
    reg [31:0] A;
    reg [31:0] B;
    wire [31:0] P;
    wire [31:0] Q;
    wire [31:0] R;

    // Instantiate the modified_Fredkin module
    modified_Fredkin uut (
        .clk(clk),
        .A(A),
        .B(B),
        .P(P),
        .Q(Q),
        .R(R)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test vector generation
    initial begin
        // Test case 1
        A = 32'hA5A5A5A5; // Input A
        B = 32'h5A5A5A5A; // Input B
        #10; // Wait for 1 clock cycle

        // Check outputs
        $display("Time: %0t | A: %h | B: %h | P: %h | Q: %h | R: %h", $time, A, B, P, Q, R);

        // Test case 2
        A = 32'hFFFFFFFF; // Input A
        B = 32'h00000000; // Input B
        #10;

        // Check outputs
        $display("Time: %0t | A: %h | B: %h | P: %h | Q: %h | R: %h", $time, A, B, P, Q, R);

        // Test case 3
        A = 32'h12345678; // Input A
        B = 32'h87654321; // Input B
        #10;

        // Check outputs
        $display("Time: %0t | A: %h | B: %h | P: %h | Q: %h | R: %h", $time, A, B, P, Q, R);

        // Test case 4
        A = 32'h00000000; // Input A
        B = 32'hFFFFFFFF; // Input B
        #10;

        // Check outputs
        $display("Time: %0t | A: %h | B: %h | P: %h | Q: %h | R: %h", $time, A, B, P, Q, R);

        // Test case 5
        A = 32'h0F0F0F0F; // Input A
        B = 32'hF0F0F0F0; // Input B
        #10;

        // Check outputs
        $display("Time: %0t | A: %h | B: %h | P: %h | Q: %h | R: %h", $time, A, B, P, Q, R);

        // Finish simulation
        #10;
        $finish;
    end
endmodule

