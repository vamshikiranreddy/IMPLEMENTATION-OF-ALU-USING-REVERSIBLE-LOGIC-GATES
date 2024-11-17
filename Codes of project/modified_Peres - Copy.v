
module modified_Peres (
    input clk,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] P,
    output reg [31:0] Q,
    output reg [31:0] R
);

parameter C=1'b0;

always @ (posedge clk) begin
    P <= A;                  // P = A
    Q <= A ^ B;              // Q = A XOR B
    R <= (A & B) ^ {32{C}};        // R = (A AND B) XOR C
end

endmodule