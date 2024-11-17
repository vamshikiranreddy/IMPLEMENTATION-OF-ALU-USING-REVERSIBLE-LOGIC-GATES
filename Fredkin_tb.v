module fendkin_tb; // Changed from fendkin_tbmodule to fendkin_tb

    reg clk;
    reg [31:0] A;
    reg [31:0] B;
    reg [31:0] C;
    wire [31:0] P;
    wire [31:0] Q;
    wire [31:0] R;

    // Instantiate the Fredkin module
    Fredkin uut (
        .clk(clk),
        .A(A),
        .B(B),
        .C(C),
        .P(P),
        .Q(Q),
        .R(R)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units clock period
    end

    // Test procedure
    initial begin
        // Monitor the output
        $monitor("Time: %0d, A: %h, B: %h, C: %h, P: %h, Q: %h, R: %h", 
                 $time, A, B, C, P, Q, R);

        // Test case 1
        A = 32'h00000001; B = 32'h00000002; C = 32'h00000003;
        #10;

        // Test case 2
        A = 32'hFFFFFFFF; B = 32'hAAAAAAAA; C = 32'h55555555;
        #10;

        // Test case 3
        A = 32'h00000000; B = 32'h11111111; C = 32'h22222222;
        #10;

        // Test case 4
        A = 32'h12345678; B = 32'h9ABCDEF0; C = 32'hFFFFFFFF;
        #10;

        // Test case 5
        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; C = 32'hFFFFFFFF;
        #10;

        // Finish the simulation
        $finish;
    end
endmodule

