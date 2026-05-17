module m_tb();
  reg   r_clk = 0;
  initial #150 forever #50 r_clk = ~r_clk;
  m_proc3 m_dut(.w_clk(r_clk));
  initial begin
      m_dut.m3.mem[0] = {12'd3,5'd0,3'd0,5'd1,7'h13};           // addi x1, x0, 3
      m_dut.m3.mem[1] = {12'd4,5'd1,3'd0,5'd2,7'h13};           // addi x2, x1, 4
      // m_dut.m3.mem[2] = {12'd5,5'd2,3'd0,5'd3,7'h13};
      m_dut.m3.mem[2] = {7'd0 ,5'd1,5'd2,3'd0,5'd1,7'b0110011}; // add  x1, x1, x2
  end
  initial #98 begin 
      forever 
          #100 
          $display("time: %3d pc: %2d w_imm: %h w_i: %2d w_r1: %2d w_r2: %2d w_s2: %2d rWB: %2d", 
              $time,
              m_dut.r_pc,
              m_dut.w_imm,
              m_dut.w_i,
              m_dut.w_r1,
              m_dut.w_r2,
              m_dut.w_s2,
              m_dut.w_rWB
            );
            // $display("time: %3d w_r1: %3d w_r2: %3d w_i: %3d w_s2: %3d", $time, m_dut.m6.w_in0, m_dut.m6.w_in1, m_dut.m6.w_sel, m_dut.m6.w_out);
            // $display("time: %3d w_r1: %3d w_s2: %3d", $time, m_dut.w_r1, m_dut.w_s2);
          // $display("pc%h %3d, %3d, %3d, %3d, %3d",m_dut.r_pc,m_dut.m3.w_insn[31:20],m_dut.m3.w_insn[19:15],m_dut.m3.w_insn[14:12],m_dut.m3.w_insn[11:7],m_dut.m3.w_insn[6:0]);
          // $display("%d", m_dut.w_imm);
  end
  initial #1000 $finish;
endmodule
