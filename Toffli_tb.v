module Toffli_tb;

    // Declare testbench variables
    reg clk;               // Clock signal
    reg [31:0] A;          // 32-bit input A
    reg [31:0] B;          // 32-bit input B
    reg [31:0] C;          // 32-bit input C
    wire [31:0] P;         // 32-bit output P
    wire [31:0] Q;         // 32-bit output Q
    wire [31:0] R;         // 32-bit output R

    // Instantiate the Toffli module
    Toffli uut (
        .clk(clk),
        .A(A),
        .B(B),
        .C(C),
        .P(P),
        .Q(Q),
        .R(R)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock with a period of 10 time units
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        A = 32'h00000000;
        B = 32'h00000000;
        C = 32'h00000000;
        
        // Wait for the clock
        #10;

        // Test case 1: All zeros
        #10;
        A = 32'hAAAAAAAA;  // Alternating bits
        B = 32'h55555555;  // Inverted alternating bits
        C = 32'h00000000;  // Zero input for C

        // Test case 2: All ones in C
        #10;
        A = 32'hFFFFFFFF;
        B = 32'hFFFFFFFF;
        C = 32'hFFFFFFFF;

        // Test case 3: Random inputs
        #10;
        A = 32'h12345678;
        B = 32'h87654321;
        C = 32'hABCDEF01;

        // Test case 4: Different combination
        #10;
        A = 32'h0F0F0F0F;
        B = 32'hF0F0F0F0;
        C = 32'h00FF00FF;

        #10;
        $stop;  // End of simulation
    end

endmodule
