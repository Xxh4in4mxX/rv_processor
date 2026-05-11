module m_tb();
  reg   r_clk = 0;
  initial #150 forever #50 r_clk = ~r_clk;
  m_circuit1 m_dut(r_clk);
  initial #99 forever #100 $display("%3d %h %b", $time, m_dut.r_pc, m_dut.w_ir);
  initial #500 $finish;
endmodule
