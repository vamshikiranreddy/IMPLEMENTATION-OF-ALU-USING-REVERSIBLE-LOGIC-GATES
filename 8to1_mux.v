module mux_8to1 (
    input [7:0] data_in,   // 8 input data signals
    input [2:0] sel,       // 3-bit selection input
    output reg data_out    // Output of the MUX
);

always @(*) begin
    case (sel)
        3'b000: data_out = data_in[0];   // Select input 0
        3'b001: data_out = data_in[1];   // Select input 1
        3'b010: data_out = data_in[2];   // Select input 2
        3'b011: data_out = data_in[3];   // Select input 3
        3'b100: data_out = data_in[4];   // Select input 4
        3'b101: data_out = data_in[5];   // Select input 5
        3'b110: data_out = data_in[6];   // Select input 6
        3'b111: data_out = data_in[7];   // Select input 7
        default: data_out = 1'b0;        // Default case (optional)
    endcase
end

endmodule
