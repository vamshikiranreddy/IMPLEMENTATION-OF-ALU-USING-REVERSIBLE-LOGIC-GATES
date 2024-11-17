module modified_Fredkin (
    input clk,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] P,
    output reg [31:0] Q,
    output reg [31:0] R
);
parameter C=1'b1;

always @ (posedge clk) begin
    P <= A;                            
    Q <= (~A & B) + (A & {32{C}});           
    R <= (A & B) + (~A & {32{C}});           
end
endmodule
