module m_adder(
    input   [31:0] w_in1,
    input   [31:0] w_in2, 
    output  [31:0] w_out
    );
    assign w_out = w_in1 + w_in2;
endmodule

