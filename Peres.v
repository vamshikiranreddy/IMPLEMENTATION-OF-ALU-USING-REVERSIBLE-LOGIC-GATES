module Peres (
    input clk,
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    output reg [31:0] P,
    output reg [31:0] Q,
    output reg [31:0] R
);

always @ (posedge clk) begin
    P <= A;                  // P = A
    Q <= A ^ B;              // Q = A XOR B
    R <= (A & B) ^ C;        // R = (A AND B) XOR C
end

endmodule
