module NonReversible_ALU_tb;

    // Testbench signals
    reg clk;
    reg [31:0] A, B, C;
    wire [31:0] mux_result1, mux_result2;
    wire [31:0] xor_result, and_result, or_result;
    wire [31:0] add_result, mux_peres_result;
    wire [31:0] nand_result, nor_result;

    // Instantiate the ALU
    NonReversible_ALU uut (
        .clk(clk),
        .A(A),
        .B(B),
        .C(C),
        .mux_result1(mux_result1),
        .mux_result2(mux_result2),
        .xor_result(xor_result),
        .and_result(and_result),
        .or_result(or_result),
        .add_result(add_result),
        .mux_peres_result(mux_peres_result),
        .nand_result(nand_result),
        .nor_result(nor_result)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with a period of 10 time units
    end

    // Test sequence
    initial begin
        // Display the results
        $monitor("Time: %0t | A = %h | B = %h | C = %h | mux_result1 = %h | mux_result2 = %h | xor_result = %h | and_result = %h | or_result = %h | add_result = %h | mux_peres_result = %h | nand_result = %h | nor_result = %h",
                 $time, A, B, C, mux_result1, mux_result2, xor_result, and_result, or_result, add_result, mux_peres_result, nand_result, nor_result);

        // Initialize inputs
        A = 32'h00000000; B = 32'h00000000; C = 32'h00000000;
        #10;

        // Test case 1
        A = 32'hFFFFFFFF; B = 32'h00000000; C = 32'h00000001;
        #10;

        // Test case 2
        A = 32'hAAAAAAAA; B = 32'h55555555; C = 32'hFFFFFFFF;
        #10;

        // Test case 3
        A = 32'h12345678; B = 32'h9ABCDEF0; C = 32'h87654321;
        #10;

        // Test case 4
        A = 32'h00000000; B = 32'hFFFFFFFF; C = 32'h00000001;
        #10;

        // Finish the simulation
        $finish;
    end

endmodule

