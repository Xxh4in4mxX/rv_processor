module am_imem_bak(
    input   [31:0] w_pc,
    output  [31:0] w_ir
    );
    assign w_ir = (w_pc == 32'd0) ? {7'd0,5'd2,5'd0,3'd0,5'd5,7'b0110011} :
                  (w_pc == 32'd4) ? {7'd0,5'd4,5'd3,3'd0,5'd6,7'b0110011} :
                                    {7'd0,5'd6,5'd5,3'd0,5'd7,7'b0110011} ;
endmodule

module am_imem(
    input   wire  [31:0] w_pc,
    output  wire  [31:0] w_insn
    );
    reg     [31:0]  mem [0:63];
    assign  w_insn = mem[w_pc[7:2]];
    integer i;
    initial for (i = 0; i < 64; i = i + 1) mem[i] = 32'd0;
endmodule
