module relational_operators_tb;

    // 1. Declare the inputs as reg since we update them inside initial blocks
    reg [3:0] a;
    reg [3:0] b;
    
    // 2. Declare the comparison flags as reg because they are updated procedurally
    reg gt;
    reg lt;
    reg gtoeq;

    initial begin
        // --- First Test Case (From the top of your image screen) ---
        // Assuming your previous lines initialized 'a' and 'b' to clean values
        a = 4'b0100; // Example: 4
        b = 4'b0010; // Example: 2
        
        gt = a > b;
        $display("the value of gt is %b", gt);
        
        lt = a < b;
        $display("the value of lt is %b", lt);

        // --- Second Test Case (Visible lines 26 to 41 in your screenshot) ---
        a = 4'b101x;   // Line 26: Injecting an unknown 'x' state into the vector
        b = 4'b1100;   // Line 28: Comparing against 12
        
        gt = a > b;    // Line 31
        $display("the value of gt is %b", gt); // Line 33
        
        lt = a < b;    // Line 35
        $display("the value of lt is %b", lt); // Line 37
        
        gtoeq = a >= b; // Line 39
        $display("the value of gt is %b", gt); // Line 41 (Note: This prints 'gt' again per your screenshot)

        $finish;
    end

endmodule