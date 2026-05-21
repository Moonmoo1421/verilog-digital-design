// Foundational Half Adder Module
module half_adder (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
    xor x1 (sum, a, b);
    and a1 (carry, a, b);
endmodule

// Top-Level Structural Full Adder Module
module full_adder_using_half_adder (
    input wire a_fa,
    input wire b_fa,
    input wire cin_fa,
    output wire sum_fa,
    output wire carry_fa
);

    // Internal connecting wires
    wire w1, w2, w3;

    // Structural Instantiations
    half_adder ha1 (
        .a(a_fa), 
        .b(b_fa), 
        .sum(w1), 
        .carry(w2)
    );
    
    half_adder ha2 (
        .a(w1), 
        .b(cin_fa), 
        .sum(sum_fa), 
        .carry(w3)
    );

    // Final Carry Logic primitive mapping
    or o1 (carry_fa, w2, w3);

endmodule
