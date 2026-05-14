module m_proc1(
    input w_clk
    );
    wire  [31:0]  w_npc, w_ir, w_r1, w_r2, w_rWB;
    wire          w_cmp1, w_cmp2;
    reg   [31:0]  r_pc = 0, r_x1 = 3;
    m_adder   m2(.w_in1(32'd4), .w_in2(r_pc), .w_out(w_npc));
    am_imem   m3(.w_pc(r_pc), .w_ir(w_ir));
    m_comp  #(.WIDTH(5))    m4(.w_in1(w_ir[19:15]), .w_in2(5'd1), .w_out(w_cmp1));
    m_comp  #(.WIDTH(5))    m5(.w_in1(w_ir[24:20]), .w_in2(5'd1), .w_out(w_cmp2));
    m_mulp    m6(.w_in0(32'd0), .w_in1(r_x1), .w_sel(w_cmp1), 
        .w_out(w_r1));
    m_mulp    m7(.w_in0(32'd0), .w_in1(r_x1), .w_sel(w_cmp2),
        .w_out(w_r2));
    m_adder   m8(.w_in1(w_r1), .w_in2(w_r2), .w_out(w_rWB));
    always @(posedge w_clk) r_pc <= w_npc;
    always @(posedge w_clk) r_x1 <= w_rWB;
endmodule
