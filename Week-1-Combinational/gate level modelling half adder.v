module half_adder_gate (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);

    // Using built-in primitive gates
    // Syntax format: gate_type instance_name (output, input1, input2);
    
    xor g1 (sum, a, b);    // 'sum' is output, 'a' and 'b' are inputs
    and g2 (carry, a, b);  // 'carry' is output, 'a' and 'b' are inputs

endmodule
