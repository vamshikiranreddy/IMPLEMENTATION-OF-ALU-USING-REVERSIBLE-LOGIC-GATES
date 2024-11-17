module Reversible_ALU (
    input [31:0] A,   // 32-bit input A
    input [31:0] B,   // 32-bit input B
    input [31:0] C,   // 32-bit input C (for specific operations)
    output reg [31:0] P_fredkin, Q_fredkin, R_fredkin, // Fredkin gate outputs
    output reg [31:0] P_peres, Q_peres, R_peres,       // Peres gate outputs
    output reg [31:0] add_result,                      // A + B + 1 result
    output reg [31:0] xor_result,                      // XOR of A and B
    output reg [31:0] and_result,                      // AND of A and B
    output reg [31:0] or_result                        // OR of A and B
);// Constants for high voltage (1) and ground (0)
    wire h = 1'b1;
    wire g = 1'b0;
// Fredkin Gate Logic
    always @(*) begin
        // Fredkin gate with A as the control and B, C as the data inputs
        P_fredkin = A; // Control input is passed through unchanged
        Q_fredkin = (A) ? B : C; // Output is B if A is 1, C if A is 0
        R_fredkin = (A) ? C : B; // Output is C if A is 1, B if A is 0
    end
// Peres Gate Logic
    always @(*) begin
        // Peres gate logic for basic operations
        P_peres = A;               // Pass input A unchanged
        Q_peres = A ^ B;           // XOR operation between A and B
        R_peres = (A & B) ^ C;     // XOR of (A AND B) with input C
    end
// Basic Arithmetic and Logical Operations
    always @(*) begin
        // A + B + 1 operation (simple addition with carry)
        add_result = A + B + 32'h00000001;
 // XOR, AND, OR operations
        xor_result = A ^ B;
        and_result = A & B;
        or_result = A | B;
    end

endmodule
