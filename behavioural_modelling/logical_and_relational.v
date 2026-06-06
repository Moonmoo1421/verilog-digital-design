module relational_and_logical_operators_tb;

    reg [3:0] a;
    reg [3:0] b;
    
    reg gt;
    reg lt;
    reg gtoeq;
    
    // Adding variables for the logical operators test
    reg logical_and;
    reg logical_or;
    reg logical_not;

    initial begin
        // ==================================================================
        // SECTION 1: RELATIONAL OPERATORS (Your original code)
        // ==================================================================
        a = 4'b0100; // 4
        b = 4'b0010; // 2
        
        gt = a > b;
        $display("Relational Test 1: gt (a > b) is %b", gt);
        
        lt = a < b;
        $display("Relational Test 1: lt (a < b) is %b", lt);

        // Relational handling of unknown 'x' state
        a = 4'b101x;   
        b = 4'b1100;   
        
        gt = a > b;    
        $display("Relational Test 2 (with x): gt (a > b) is %b", gt); // Will print 'x'
        
        lt = a < b;    
        $display("Relational Test 2 (with x): lt (a < b) is %b", lt); // Will print 'x'

        // ==================================================================
        // SECTION 2: LOGICAL OPERATORS (Add this now!)
        // ==================================================================
        // 'a' is still 4'b101x. Because the first three bits are 101, 
        // it can NEVER be zero. Therefore, Verilog treats 'a' as a solid TRUE (1).
        // 'b' is 4'b1100, which is also non-zero, so it is TRUE (1).
        
        logical_and = a && b; // True AND True
        $display("Logical Test: a && b is %b", logical_and); // Prints 1!

        logical_or  = a || b; // True OR True
        $display("Logical Test: a || b is %b", logical_or);  // Prints 1!

        logical_not = !a;     // NOT True
        $display("Logical Test: !a is %b", logical_not);     // Prints 0!

        $finish;
    end

endmodule