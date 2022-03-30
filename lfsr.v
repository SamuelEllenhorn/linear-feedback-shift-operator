module lfsr
    #(parameter N = 64) (
        input clk,
        input reset_,
        output [1:N] Q
    );

    reg [1:N] Q_reg, Q_next;
    wire taps;

    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'dl;
        else
            Q_reg <= Q_next;
    end

    always @(taps, Q_reg) begin
        Q_next = {taps, Q_reg[1:N-1]};

    assign Q = Q_reg;

    assign taps = Q_reg[64] ^ Q_reg[63];


endmodule