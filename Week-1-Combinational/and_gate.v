// A simple 2-input AND gate module
module and_gate (
    input wire a,
    input wire b,
    output wire y
);

    assign y = a & b;

endmodule
