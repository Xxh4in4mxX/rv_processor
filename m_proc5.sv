module m_proc5(
    input w_clk
    );
    wire  [31:0]  w_npc, w_ir, w_r1, w_r2, w_imm, w_s2, w_alu;
    wire  [31:0]  w_ldd, w_rWB, w_pcin, w_tpc;
    wire          w_tkn;
    reg   [31:0]  r_pc = 0;
    wire          w_r,w_i,w_s,w_b,w_u,w_j,w_ld;
    m_adder       m2(
        .w_in1(32'd4),
        .w_in2(r_pc),
        .w_out(w_npc)
        );
    am_imem       m3(
        .w_pc(r_pc),
        .w_insn(w_ir)
        );
    m_gen_imm     m4(w_ir,w_r,w_i,w_s,w_b,w_u,w_j,w_ld,w_imm);
    m_rf          m5(
        .w_clk(w_clk),
        .w_we(!w_s & !w_b),
        .w_ra1(w_ir[19:15]),
        .w_ra2(w_ir[24:20]),
        .w_wa(w_ir[11:7]),
        .w_wd(w_rWB),
        .w_rd1(w_r1),
        .w_rd2(w_r2)
        );
    m_adder       m6(w_imm,r_pc,w_tpc);
    m_mulp        m7(w_r2,w_imm,!w_r & !w_b,w_s2);
    m_alu         m8(w_r1,w_s2,w_alu,w_tkn);
    am_dmem       m9(.clk(w_clk), .w_adr(w_alu), .w_wd(w_r2), .w_we(w_s), .w_rd(w_ldd));
    m_mulp        m10(w_alu, w_ldd, w_ld, w_rWB);
    m_mulp        m11(w_npc, w_tpc, w_b & w_tkn, w_pcin);
    always @(posedge w_clk) begin r_pc <= w_pcin; end
endmodule
