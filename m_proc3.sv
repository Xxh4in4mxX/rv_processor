//  this processor can perform multiple add instructions
//  change the am_imem.sv module to reconfig the instructions
module m_proc3(
    input w_clk
    );
    wire  [31:0]  w_npc, w_ir, w_r1, w_r2, w_rWB, w_imm, w_s2;
    wire          w_r, w_i, w_s, w_b, w_u, w_j, w_ld;
    reg   [31:0]  r_pc = 0;
    m_adder   m2(.w_in1(32'd4), .w_in2(r_pc), .w_out(w_npc));
    am_imem   m3(.w_pc(r_pc), .w_insn(w_ir));
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
    m_gen_imm   m5(w_ir,w_r,w_i,w_s,w_b,w_u,w_j,w_ld,w_imm);
    m_mulp      m6(w_r1,w_r2,w_i,w_s2);
    m_adder     m7(.w_in1(w_r1), .w_in2(w_s2), .w_out(w_rWB));
    always @(posedge w_clk) r_pc <= w_npc;
endmodule
