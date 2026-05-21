// ========================================================
// 1. HARDWARE DESIGN CODE
// ========================================================
module half_adder (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
    xor x1 (sum, a, b);
    and a1 (carry, a, b);
endmodule

module full_adder_using_half_adder (
    input wire a_fa,
    input wire b_fa,
    input wire cin_fa,
    output wire sum_fa,
    output wire carry_fa
);
    wire w1, w2, w3;

    half_adder ha1 (.a(a_fa), .b(b_fa), .sum(w1), .carry(w2));
    half_adder ha2 (.a(w1), .b(cin_fa), .sum(sum_fa), .carry(w3));
    or o1 (carry_fa, w2, w3);
endmodule


// ========================================================
// 2. SIMULATION TESTBENCH CODE
// ========================================================
module tb_full_adder_tutorial;
    reg t_a, t_b, t_cin;
    wire t_sum, t_carry;

    full_adder_using_half_adder uut (
        .a_fa(t_a), .b_fa(t_b), .cin_fa(t_cin),
        .sum_fa(t_sum), .carry_fa(t_carry)
    );

    initial begin
        t_a = 1; t_b = 0; t_cin = 1; #10;
        t_a = 1; t_b = 1; t_cin = 1; #10;
    end
endmodule
