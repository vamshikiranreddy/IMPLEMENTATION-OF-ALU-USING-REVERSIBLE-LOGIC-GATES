`timescale 1ns/1ps

module arthematic_operations_tb;

    // Testbench variables to connect to the DUT (Device Under Test)
    reg [31:0] A, B, C;
    wire [31:0] P_fredkin1, Q_fredkin1, R_fredkin1;
    wire [31:0] P_fredkin2, Q_fredkin2, R_fredkin2;
    wire [31:0] P_peres, Q_peres, R_peres;
    wire [31:0] xor_result, not_result1, and_result, nand_result, a_b_one_result, or_result, nor_result;

    // Instantiate the DUT (Arithmetic_operations)
    Arithmetic_operations dut (
        .A(A), .B(B), .C(C),
        .P_fredkin1(P_fredkin1), .Q_fredkin1(Q_fredkin1), .R_fredkin1(R_fredkin1),
        .P_fredkin2(P_fredkin2), .Q_fredkin2(Q_fredkin2), .R_fredkin2(R_fredkin2),
        .P_peres(P_peres), .Q_peres(Q_peres), .R_peres(R_peres),
        .xor_result(xor_result),
        .not_result1(not_result1), .and_result(and_result), .nand_result(nand_result),
        .a_b_one_result(a_b_one_result), .or_result(or_result), .nor_result(nor_result)
    );

    // Test stimuli
    initial begin
        // Initialize inputs
        A = 32'h00000000; B = 32'h00000000; C = 32'h00000000;
        #10;

        // Apply test vectors
        A = 32'hFFFFFFFF; B = 32'h00000000; C = 32'h00000000; // Test case 1
        #10;

        A = 32'hAAAAAAAA; B = 32'h55555555; C = 32'h00000001; // Test case 2
        #10;

        A = 32'h12345678; B = 32'h9ABCDEF0; C = 32'h87654321; // Test case 3
        #10;

        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; C = 32'h00000000; // Test case 4
        #10;

        A = 32'h00000000; B = 32'hFFFFFFFF; C = 32'h00000001; // Test case 5
        #10;

        // Finish the simulation
        $finish;
    end

    // Monitor all the outputs
    initial begin
        $monitor("Time: %0t | A = %h | B = %h | C = %h | P_fredkin1 = %h | Q_fredkin1 = %h | R_fredkin1 = %h | P_fredkin2 = %h | Q_fredkin2 = %h | R_fredkin2 = %h | P_peres = %h | Q_peres = %h | R_peres = %h | xor_result = %h | not_result1 = %h | and_result = %h | nand_result = %h | a_b_one_result = %h | or_result = %h | nor_result = %h",
                 $time, A, B, C, P_fredkin1, Q_fredkin1, R_fredkin1, P_fredkin2, Q_fredkin2, R_fredkin2, P_peres, Q_peres, R_peres, xor_result, not_result1, and_result, nand_result, a_b_one_result, or_result, nor_result);
    end

endmodule

