module Arthmetic_operations (
    input [31:0] A,   // 32-bit input A
    input [31:0] B,   // 32-bit input B
    input [31:0] C,   // 32-bit input C
    output reg [31:0] P_fredkin1, Q_fredkin1, R_fredkin1,
    output reg [31:0] P_fredkin2, Q_fredkin2, R_fredkin2,
    output reg [31:0] P_peres, Q_peres, R_peres,
    output reg [31:0] xor_result,
    output reg [31:0] not_result1,
    output reg [31:0] and_result,
    output reg [31:0] nand_result,
    output reg [31:0] or_result,
    output reg [31:0] nor_result,
    output reg [31:0] a_b_one_result
);

    // Define constants for high voltage (1) and ground (0)
    wire h = 1'b1;
    wire g = 1'b0;

    // Fredkin Gate 1 (outputs: P_fredkin1, Q_fredkin1, R_fredkin1)
    always @(*) begin
        P_fredkin1 = A;
        Q_fredkin1 = (A & B) | (~A & h);
        R_fredkin1 = (A & h) | (~A & B);
    end

    // Fredkin Gate 2 (outputs: P_fredkin2, Q_fredkin2, R_fredkin2)
    always @(*) begin
        P_fredkin2 = h;
        Q_fredkin2 = (h & Q_fredkin1) | (~h & h);
        R_fredkin2 = (h & h) | (~h & Q_fredkin1);
    end

    // Peres Gate (outputs: P_peres, Q_peres, R_peres)
    always @(*) begin
        P_peres = A;
        Q_peres = A ^ B;               // XOR of A and B
        R_peres = (A & B) ^ g;         // AB XOR C
    end

    // A + B + 1
    always @(*) begin
        a_b_one_result = Q_fredkin2; // Ensure this is calculated properly
    end

    // OR operation
    always @(*) begin
        or_result = Q_fredkin1;      // Assuming this is meant to be Q_fredkin1
    end

    // NOR operation
    always @(*) begin
        nor_result = ~(Q_fredkin1);
    end

    // XOR of A and B
    always @(*) begin
        xor_result = Q_peres;
    end

    // NOT operation for input A
    always @(*) begin
        not_result1 = ~A;            // NOT of A
    end

    // AND operation for A and B
    always @(*) begin
        and_result = A & B;          // AND of A and B
    end

    // NAND operation for A and B
    always @(*) begin
        nand_result = ~(A & B);      // NAND of A and B
    end

endmodule

