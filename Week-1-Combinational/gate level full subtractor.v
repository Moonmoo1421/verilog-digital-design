// ==========================================
// 1. THE DESIGN MODULE (Gate-Level)
// ==========================================
module full_subtractor (
    input wire a,
    input wire b,
    input wire bin,
    output wire diff,
    output wire bout
);

    // Internal connection wires
    wire xor_ab;
    wire not_a;
    wire not_xor_ab;
    wire and1_out;
    wire and2_out;

    // --- Difference Logic ---
    // diff = (a XOR b) XOR bin
    xor G1 (xor_ab, a, b);
    xor G2 (diff, xor_ab, bin);

    // --- Borrow-out Logic ---
    // bout = (NOT a AND b) OR (NOT(a XOR b) AND bin)
    not G3 (not_a, a);
    and G4 (and1_out, not_a, b);       // Term 1: ~a & b

    not G5 (not_xor_ab, xor_ab);
    and G6 (and2_out, not_xor_ab, bin); // Term 2: ~(a ^ b) & bin

    or  G7 (bout, and1_out, and2_out);  // Combine terms with OR

endmodule


// ==========================================
// 2. THE TESTBENCH MODULE
// ==========================================
module full_subtractor_tb;

    // Inputs are registers (reg)
    reg a;
    reg b;
    reg bin;
    
    // Outputs are wires
    wire diff;
    wire bout;

    // Instantiate the Unit Under Test (UUT)
    full_subtractor uut (
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .bout(bout)
    );

    initial begin
        // Print a clean header template in the simulation console
        $display("A B Bin | Diff Bout");
        $display("-------------------");

        // Apply all 8 binary input combinations with a 10ns delay
        a = 0; b = 0; bin = 0; #10;
        $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);
        
        a = 0; b = 0; bin = 1; #10;
        $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);
        
        a = 0; b = 1; bin = 0; #10;
        $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);
        
        a = 0; b = 1; bin = 1; #10;
        $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);
        
        a = 1; b = 0; bin = 0; #10;
        $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);
        
        a = 1; b = 0; bin = 1; #10;
        $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);
        
        a = 1; b = 1; bin = 0; #10;
        $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);
        
        a = 1; b = 1; bin = 1; #10;
        $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);

        $finish; // End simulation
    end

endmodule