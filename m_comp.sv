module m_comp #(parameter WIDTH = 32) (
    input   [WIDTH-1:0]   w_in1,
    input   [WIDTH-1:0]   w_in2,
    output                w_out
    );
    assign w_out = (w_in1 == w_in2);
endmodule
