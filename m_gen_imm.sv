module m_gen_imm(
    input     [31:0]  w_ir,
    output            w_r, w_i, w_s, w_b, w_u, w_j, w_ld,
    output    [31:0]  w_imm
    );
    m_get_type  m1(w_ir[6:2], w_r, w_i, w_s, w_b, w_u, w_j);
    m_get_imm   m2(w_ir, w_i, w_s, w_b, w_u, w_j, w_imm);
    assign      w_ld = (w_ir[6:2] == 0);
endmodule

module m_get_type(
    input     [4:0]   opcode5,  
    output            w_r, w_i, w_s, w_b, w_u, w_j
    );
    assign    w_r = (opcode5 == 5'b01100);
    assign    w_s = (opcode5 == 5'b01000);
    assign    w_b = (opcode5 == 5'b01100);
    assign    w_u = (opcode5 == 5'b00101);
    assign    w_j = (opcode5 == 5'b11011);
    assign    w_i = ~ (w_r | w_s | w_b | w_u | w_j);
endmodule

module m_get_imm(
    input     [31:0]  w_ir,
    input             w_i, w_s, w_b, w_u, w_j,
    output    [31:0]  w_imm
    );
    assign imm = 
        (w_i) ? {{20{w_ir[31]}}, w_ir[31:20]} :
        (w_s) ? {{20{w_ir[31]}}, w_ir[31:25], w_ir[11:7]} :
        (w_b) ? {{20{w_ir[31]}},w_ir[7],w_ir[30:25],w_ir[11:8],1'b0} :
        (w_u) ? {w_ir[31:12], 12'b0} :
        (w_j) ? {{12{w_ir[31]}},w_ir[19:12],w_ir[20],w_ir[30:21],1'b0} : 0;
endmodule
