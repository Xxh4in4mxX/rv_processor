module am_dmem(
    input                 clk,
    input   wire  [31:0]  w_adr, w_wd,
    input   wire          w_we,
    output  wire  [31:0]  w_rd
    );
    reg   [31:0]  mem [63:0];
    assign        w_rd = mem[w_adr];
    always @(posedge clk)
        if (w_we == 1'b1)
            mem[w_adr] <= w_wd;
    integer i;
    initial for (i = 0; i < 64; i = i + 1) mem[i] = 32'd0;
endmodule
