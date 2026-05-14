//  this processor can perform multiple add instructions
//  change the am_imem.sv module to reconfig the instructions
module m_proc2(
    input w_clk
    );
    wire  [31:0]  w_npc, w_ir, w_r1, w_r2, w_rWB;
    reg   [31:0]  r_pc = 0, r_x1 = 3;
    m_adder   m2(.w_in1(32'd4), .w_in2(r_pc), .w_out(w_npc));
    am_imem   m3(.w_pc(r_pc), .w_ir(w_ir));
    m_rf      m4(
        .w_clk(w_clk),
        .w_we(1'b1),
        .w_ra1(w_ir[19:15]),
        .w_ra2(w_ir[24:20]),
        .w_wa(w_ir[11:7]),
        .w_rd1(w_r1),
        .w_rd2(w_r2),
        .w_wd(w_rWB)
    );
    m_adder   m5(.w_in1(w_r1), .w_in2(w_r2), .w_out(w_rWB));
    always @(posedge w_clk) r_pc <= w_npc;
endmodule
