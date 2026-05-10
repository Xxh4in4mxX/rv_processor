module am_imem(
    input   [31:0] w_pc,
    output  [31:0] w_ir
    );

    assign w_ir = (w_pc == 32'd0) ? {7'd0,5'd1,5'd0,3'd0,5'd1,7'b0110011} :
                  (w_pc == 32'd4) ? {7'd0,5'd0,5'd1,3'd0,5'd1,7'b0110011} :
                                    {7'd0,5'd1,5'd1,3'd0,5'd1,7'b0110011};
endmodule
