module pipeline_two(
nty,
sty,
ety,
wty,
clk,
nxt,
sxt,
wxt,
ext
);

input [9:0] nty;
input [9:0] sty;
input [9:0] ety;
input [9:0] wty;
input clk;
output [9:0] nxt;
output [9:0] sxt;
output [9:0] wxt;
output [9:0] ext;

wire [9:0] nty;
wire [9:0] sty;
wire [9:0] ety;
wire [9:0] wty;
wire clk;
reg [9:0] nxt;
reg [9:0] sxt;
reg [9:0] wxt;
reg [9:0] ext;

reg [9:0] pipeline2 [0:11];
integer i;
integer j;

initial begin
i=0;
end

always @ (nty or sty or ety or wty) begin
	if(i < 8) begin
	pipeline2 [i] = nty;
	pipeline2 [i+1] = sty;
        pipeline2 [i+2] = ety;
	pipeline2 [i+3] = wty;
	i=i+4;
	end                      //No k variable needed as time of all inputs received
end                              //is obvious (due to automated assignment)
 
always @ (posedge clk) begin
	nxt = pipeline2 [0];
	sxt = pipeline2 [1];
	ext = pipeline2 [2];
	wxt = pipeline2 [3];
	for(j = 0; j<8 ; j = j+1) begin
            pipeline2 [j] = pipeline2 [j+4];
	end
	if(i !== 0)
	i = i-4;
end

combone U0(
.nin(),
.sin(),
.ein(),
.win(),
.lin(),
.nout(nty),
.sout(sty),
.eout(ety),
.wout(wty),
.lout()
);

pdn U1(
.north_in(nxt),
.south_in(sxt),
.west_in(wxt),
.east_in(ext),
.north_out(),
.south_out(),
.east_out(),
.west_out()
);

pipeline_one U2(            //Instantiated for the clock
.inc(),
.nsig(),
.ssig(),
.esig(),
.wsig(),
.lsig(),
.clksig(),
.noun(),
.soun(),
.eoun(),
.woun(),
.loun(),
.clk(clk)
);

endmodule