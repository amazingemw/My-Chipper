module chipper (
nin,
sin,
ein,
win,
clk,
lin,
nout,
sout,
eout,
wout,
lout
);
input [9:0] nin;
input [9:0] sin;
input [9:0] ein;
input [9:0] win;
input [9:0] lin;
input clk;
output [9:0] nout;
output [9:0] sout;
output [9:0] eout;
output [9:0] wout;
output [9:0] lout;

wire [9:0] nin;
wire [9:0] sin;
wire [9:0] ein;
wire [9:0] win;
wire [9:0] lin;
wire clk;
wire [9:0] nout;
wire [9:0] sout;
wire [9:0] eout;
wire [9:0] wout;
wire [9:0] lout;


wire [9:0] stage1_n;   //from ejector module
wire [9:0] stage1_s;
wire [9:0] stage1_e;
wire [9:0] stage1_w;

wire [9:0] stage2_n;   //from injector module
wire [9:0] stage2_s;
wire [9:0] stage2_e;
wire [9:0] stage2_w;


ejector U0 (
.northad(nin),
.southad(sin),
.eastad(ein),
.westad(win),
.clk(clk),
.nad(stage1_n),
.sad(stage1_s),
.ead(stage1_e),
.wad(stage1_w),
.lad(lout)
);

injector U1 (
.northad(stage1_n),
.southad(stage1_s),
.eastad(stage1_e),
.westad(stage1_w),
.localad(lin),
.clk(clk),
.nad(stage2_n),
.sad(stage2_s),
.ead(stage2_e),
.wad(stage2_w)
);

pdn U3 (
.north_in(stage2_n),
.south_in(stage2_s),
.west_in(stage2_w),
.east_in(stage2_e),
.clk(clk),
.north_out(nout),
.south_out(sout),
.east_out(eout),
.west_out(wout)
);

endmodule
