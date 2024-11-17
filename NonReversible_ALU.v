
module NonReversible_ALU (
    input clk,                      // Clock signal
    input [31:0] A,                 // 32-bit input A
    input [31:0] B,                 // 32-bit input B
    input [31:0] C,                 // 32-bit input C (for specific operations)
    output reg [31:0] mux_result1,  // MUX result (equivalent to Fredkin gate)
    output reg [31:0] mux_result2,  // MUX result (equivalent to Fredkin gate)
    output reg [31:0] xor_result,   // XOR of A and B
    output reg [31:0] and_result,   // AND of A and B
    output reg [31:0] or_result,    // OR of A and B
    output reg [31:0] add_result,   // A + B + 1 result
    output reg [31:0] mux_peres_result, // Equivalent of Peres gate result
    output reg [31:0] nand_result,  // NAND of A and B
    output reg [31:0] nor_result    // NOR of A and B
);

    // MUX Logic (equivalent to Fredkin Gate)
    always @(posedge clk) begin
        // MUX logic using clock signal
        mux_result1 <= (A) ? B : C; // If A is 1, output is B; if A is 0, output is C
        mux_result2 <= (A) ? C : B; // If A is 1, output is C; if A is 0, output is B
    end

    // Basic Arithmetic and Logical Operations
    always @(posedge clk) begin
        // Addition operation: A + B + 1
        add_result <= A + B + 32'h00000001;

        // Logical operations
        xor_result <= A ^ B;        // XOR of A and B
        and_result <= A & B;        // AND of A and B
        or_result <= A | B;         // OR of A and B
        nand_result <= ~(A & B);    // NAND of A and B
        nor_result <= ~(A | B);     // NOR of A and B
    end

    // Peres Gate Equivalent Logic
    always @(posedge clk) begin
        // Using standard gates instead of Peres gate
        mux_peres_result <= (A & B) ^ C; // XOR of (A AND B) with input C
    end

endmodule
