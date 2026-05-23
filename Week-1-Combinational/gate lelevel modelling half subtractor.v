// ==========================================
// 1. THE DESIGN MODULE (Gate-Level)
// ==========================================
module half_subtractor (
    input wire a,
    input wire b,
    output wire diff,
    output wire borrow
);

    // Internal wire to connect the NOT gate output to the AND gate input
    wire not_a;

    // Gate Primitives Syntax: gate_type instance_name (output, input1, input2);
    xor G1 (diff, a, b);       // Difference Logic: diff = a XOR b
    not G2 (not_a, a);         // Inverts input 'a'
    and G3 (borrow, not_a, b); // Borrow Logic: borrow = (NOT a) AND b

endmodule


// ==========================================
// 2. THE TESTBENCH MODULE
// ==========================================
module half_subtractor_tb;

    // Inputs are registers (reg) because we manually change their values
    reg a;
    reg b;
    
    // Outputs are wires to observe the design's response
    wire diff;
    wire borrow;

    // Instantiate the Unit Under Test (UUT) using structural port mapping
    half_subtractor uut (
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        // Print a clean header template in the simulation console
        $display("A B | Diff Borrow");
        $display("------------");

        // Apply all 4 binary input combinations with a 10ns delay between each
        a = 0; b = 0; #10;
        $display("%b %b |  %b     %b", a, b, diff, borrow);
        
        a = 0; b = 1; #10;
        $display("%b %b |  %b     %b", a, b, diff, borrow);
        
        a = 1; b = 0; #10;
        $display("%b %b |  %b     %b", a, b, diff, borrow);
        
        a = 1; b = 1; #10;
        $display("%b %b |  %b     %b", a, b, diff, borrow);

        $finish; // Terminate simulation safely
    end

endmodule