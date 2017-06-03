module pdn(
north_in,
south_in,
west_in,
east_in,
clk,
north_out,
south_out,
east_out,
west_out
);

input [9:0] north_in;
input [9:0] south_in;
input [9:0] west_in;
input [9:0] east_in;
input clk;
output [9:0] north_out;
output [9:0] south_out;
output [9:0] east_out;
output [9:0] west_out;

wire [9:0] north_in;
wire [9:0] south_in;
wire [9:0] west_in;
wire [9:0] east_in;
wire clk;
reg [9:0] north_out;
reg [9:0] south_out;
reg [9:0] east_out;
reg [9:0] west_out;


wire [9:0] inter_1;
wire [9:0] inter_2;
wire [9:0] inter_3;
wire [9:0] inter_4;
wire [9:0] inter_5; //n
wire [9:0] inter_6; //s
wire [9:0] inter_7; //e
wire [9:0] inter_8; //w


twoarb u0 (north_in , east_in , clk, inter_1, inter_2);
twoarb u1 (south_in , west_in , clk, inter_3, inter_4);
arbb a1 (inter_1, inter_3, clk, inter_5, inter_6);
arbd b1 (inter_2, inter_4, clk, inter_7, inter_8);

always @ (inter_8) begin
north_out = inter_5;
south_out = inter_6;
east_out  = inter_7;
west_out  = inter_8;
end

endmodule
