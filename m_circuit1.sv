module m_circuit1(
    input w_clk
    );
    reg   [31:0] r_pc = 32'b0;
    wire  [31:0] n_pc;
    wire  [31:0] w_ir;
    
    m_adder n_pc_cal(
        .w_in1(32'd4),
        .w_in2(r_pc),
        .w_out(n_pc)
        );

    always @(posedge w_clk) begin
        r_pc <= n_pc;
    end

    am_imem i_am_imem(
        .w_pc(r_pc),
        .w_ir(w_ir)
    );
endmodule
