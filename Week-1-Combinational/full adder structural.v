
// 1. THE REUSABLE CHILD CHIP
module half_adder (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule


// 2. THE TOP-LEVEL CHIP (Connecting them together)
module full_adder (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);

    // Declaring internal board wires to link the two chips together
    wire s1; 
    wire c1;
    wire c2;

    // Instantiating the First Half Adder
    half_adder HA1 (
        .a(a),
        .b(b),
        .sum(s1),     // Connects to internal wire s1
        .carry(c1)    // Connects to internal wire c1
    );

    // Instantiating the Second Half Adder
    half_adder HA2 (
        .a(s1),       // Takes intermediate sum s1 as an input
        .b(cin),      // Takes the external cin as an input
        .sum(sum),    // Connects directly to the final external sum pin
        .carry(c2)    // Connects to internal wire c2
    );

    // Combining the two internal carry wires using an OR gate
    assign cout = c1 | c2;

endmodule
