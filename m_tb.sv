module m_tb();
  reg   r_clk = 0;
  // 200 = 1, 300 = 1, 400 = 1
  initial #150 forever #50 r_clk = ~r_clk;
  m_proc1 m_dut(.w_clk(r_clk));
  initial #99 forever #100 $display("%3d %h %h %h", $time,
      m_dut.w_r1, m_dut.w_r2, m_dut.w_rWB);
  initial #500 $finish;
endmodule
