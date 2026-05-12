module m_tb();
  reg   r_clk = 0;
  // 200 = 1, 300 = 1, 400 = 1
  initial #150 forever #50 r_clk = ~r_clk;
  m_proc2 m_dut(.w_clk(r_clk));
  initial begin
      m_dut.m4.mem[1] = 5;
      m_dut.m4.mem[2] = 6;
      m_dut.m4.mem[3] = 7;
      m_dut.m4.mem[4] = 8;
  end
  initial #99 forever #100 $display("time: %3d w_r1: %5d w_r2: %5d rWB: %5d", $time,
      m_dut.w_r1, m_dut.w_r2, m_dut.w_rWB);
  initial #500 $finish;
endmodule
