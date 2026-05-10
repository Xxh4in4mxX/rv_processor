module m_tb();
  reg   r_clk = 0;
  initial #150 forever #50 r_clk = ~r_clk;
  m_circuit1 m_dut(r_clk);
  initial #99 forever #100 $display("%3d %h", $time, m_dut.r_pc);
  initial #500 $finish;
endmodule
