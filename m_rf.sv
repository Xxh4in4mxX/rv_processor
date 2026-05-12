module m_rf(
    input           w_clk, w_we,
    input   [4:0]   w_ra1, w_ra2, w_wa,
    output  [31:0]  w_rd1, w_rd2,
    input   [31:0]  w_wd
    );

    reg     [31:0]  mem [0:31];
    // textbook assign: here i do not follow the textbook as i think the x0
    // register is 0 too
    // assign w_rdN = (w_raN == 5'd0) ? 32'd0 : mem[w_raN];
    assign  w_rd1 = mem[w_ra1];
    assign  w_rd2 = mem[w_ra2];

    always @(posedge w_clk) if (w_we) mem[w_wa] <= w_wd;
    // for simulation; stop the program when you have written to register 30
    always @(posedge w_clk) if (w_we && w_wa==5'd30) $finish;

    // for simulation; doesn't actually run on FPGA (initial block)
    integer i; initial for (i = 0; i < 32; i=i+1) mem[i]=32'b0;

endmodule
