
`timescale 1ns/1ps

module Reversible_ALU_tb;
// Testbench variables
    reg [31:0] A, B, C;             // Inputs to the ALU
    wire [31:0] P_fredkin, Q_fredkin, R_fredkin;  // Fredkin outputs
    wire [31:0] P_peres, Q_peres, R_peres;        // Peres outputs
    wire [31:0] add_result;                       // A + B + 1 result
    wire [31:0] xor_result;                       // XOR result
    wire [31:0] and_result;                       // AND result
    wire [31:0] or_result;                        // OR result
// Instantiate the DUT (Reversible_ALU)
    Reversible_ALU dut (
        .A(A), .B(B), .C(C),
        .P_fredkin(P_fredkin), .Q_fredkin(Q_fredkin), .R_fredkin(R_fredkin),
        .P_peres(P_peres), .Q_peres(Q_peres), .R_peres(R_peres),
        .add_result(add_result),
        .xor_result(xor_result),
        .and_result(and_result),
        .or_result(or_result)
    );
// Test stimuli
    initial begin
        // Display header for readability
        $display("Time\t\tA\t\tB\t\tC\t\tP_fredkin\tQ_fredkin\tR_fredkin\tP_peres\t\tQ_peres\t\tR_peres\t\tadd_result\txor_result\tand_result\tor_result");
        // Initialize inputs and apply test vectors
        A = 32'h00000000; B = 32'h00000000; C = 32'h00000000; #10;  // Test case 1
        A = 32'hFFFFFFFF; B = 32'h00000000; C = 32'h00000001; #10;  // Test case 2
        A = 32'h12345678; B = 32'h9ABCDEF0; C = 32'h87654321; #10;  // Test case 3
        A = 32'hAAAAAAAA; B = 32'h55555555; C = 32'h00000000; #10;  // Test case 4
        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; C = 32'h00000000; #10;  // Test case 5
// Finish simulation
        $finish;
    end
// Monitor all outputs and display them whenever there is a change
    initial begin
        $monitor("Time: %0t | A = %h | B = %h | C = %h | P_fredkin = %h | Q_fredkin = %h | R_fredkin = %h | P_peres = %h | Q_peres = %h | R_peres = %h | add_result = %h | xor_result = %h | and_result = %h | or_result = %h",
                 $time, A, B, C, P_fredkin, Q_fredkin, R_fredkin, P_peres, Q_peres, R_peres, add_result, xor_result, and_result, or_result);
    end

endmodule
