module m_mulp #(parameter WIDTH = 32) (
    input   [WIDTH-1:0]   w_in0,
    input   [WIDTH-1:0]   w_in1,
    input                 w_sel,
    output  [WIDTH-1:0]   w_out
    );
    assign w_out = (w_sel) ? w_in1 : w_in0;
endmodule
