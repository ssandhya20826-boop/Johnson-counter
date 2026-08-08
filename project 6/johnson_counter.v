module johnson_counter #(
    parameter WIDTH = 4
)(
    input  wire             clk,
    input  wire             reset,
    output reg [WIDTH-1:0]  q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= {WIDTH{1'b0}};
    else
        q <= {q[WIDTH-2:0], ~q[WIDTH-1]};
end

endmodule