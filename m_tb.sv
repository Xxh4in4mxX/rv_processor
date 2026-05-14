module m_tb();
  reg   r_clk = 0;
  initial #150 forever #50 r_clk = ~r_clk;
  m_proc3 m_dut(.w_clk(r_clk));
  initial begin
      m_dut.m3.mem[0] = {12'd3,5'd0,3'd0,5'd1,7'h13};
      m_dut.m3.mem[1] = {12'd4,5'd1,3'd0,5'd2,7'h13};
      m_dut.m3.mem[2] = {12'd5,5'd2,3'd0,5'd3,7'h13};
  end
  initial #99 forever #100 $display("time: %3d w_r1: %5d w_r2: %5d rWB: %5d", $time,
      m_dut.w_r1, m_dut.w_s2, m_dut.w_rWB);
  initial #1000 $finish;
endmodule
