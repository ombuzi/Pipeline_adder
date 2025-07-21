module pipelined_adder (
    input clk,
    input rst_n,
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] sum
);
    reg [31:0] a_reg, b_reg; // Pipeline registers
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_reg <= 0;
            b_reg <= 0;
        end else begin
            a_reg <= a;
            b_reg <= b;
        end
    end
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) sum <= 0;
        else sum <= a_reg + b_reg;
    end
endmodule