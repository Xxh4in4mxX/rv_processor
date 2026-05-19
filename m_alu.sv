module m_alu(
    input   [31:0] w_in1, w_in2,
    output  [31:0] w_out,
    output         w_tkn
    );
    assign w_out = w_in1 + w_in2;
    assign w_tkn = (w_in1 != w_in2);
endmodule
