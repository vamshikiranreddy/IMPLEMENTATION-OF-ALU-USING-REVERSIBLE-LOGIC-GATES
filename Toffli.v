module Toffli (
    input clk,
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    output reg [31:0] P,
    output reg [31:0] Q,
    output reg [31:0] R
);

always @ (posedge clk) begin
    P <= A;
    Q <= B;
    R <= (A & B) ^ C;
end

endmodule
