module pdn(
north_in,
south_in,
west_in,
east_in,
north_out,
south_out,
east_out,
west_out
);

input [9:0] north_in;
input [9:0] south_in;
input [9:0] west_in;
input [9:0] east_in;
output [9:0] north_out;
output [9:0] south_out;
output [9:0] east_out;
output [9:0] west_out;

wire [9:0] north_in;
wire [9:0] south_in;
wire [9:0] west_in;
wire [9:0] east_in;
wire [9:0] north_out;
wire [9:0] south_out;
wire [9:0] east_out;
wire [9:0] west_out;


wire [9:0] inter_1;
wire [9:0] inter_2;
wire [9:0] inter_3;
wire [9:0] inter_4;


twoarb u0 (north_in , east_in , inter_1, inter_2);
twoarb u1 (south_in , west_in , inter_3, inter_4);
arbb a1 (inter_1, inter_3, north_out, south_out);
arbd b1 (inter_2, inter_4, east_out, west_out);


endmodule
