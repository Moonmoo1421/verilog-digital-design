module full_adder (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire carry
);

    // Internal wires to connect the gates together
    wire w1, w2, w3;
    wire s1; // Internal wire connecting the two 2-input XOR gates

    // --- SUM LOGIC (Cascaded 2-input XOR gates) ---
    xor x1 (s1, a, b);       // s1 = a ^ b
    xor x2 (sum, s1, cin);   // final sum = s1 ^ cin

    // --- CARRY LOGIC ---
    and a1 (w1, a, b);       // w1 = a & b
    and a2 (w2, b, cin);     // w2 = b & cin
    and a3 (w3, a, cin);     // w3 = a & cin

    // 3-input OR gate is perfectly valid for primitives
    or  o1 (carry, w1, w2, w3); 

endmodule
