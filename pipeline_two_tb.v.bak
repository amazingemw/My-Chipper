module pipeline_two_tb();

reg [9:0] nty;  
reg [9:0] sty; 
reg [9:0] ety; 
reg [9:0] wty;
reg clk;
wire [9:0] nxt;
wire [9:0] sxt;
wire [9:0] ext;
wire [9:0] wxt;

always begin
#5.5 clk = ~clk;
end

initial begin
    clk = 0;	
    nty = 10'bz;
    sty = 10'b0000000101;
    ety = 10'b1000100001;
    wty = 10'b0000100100;

#12 nty = 10'b1000100100; //l
    sty = 10'b0000111111; //e
    ety = 10'b0000101100; //n
    wty = 10'b0000011100; //w

#12 nty = 10'b0000100110; //e
    sty = 10'b0000000001; //w
    ety = 10'b1000101100; //l
    wty = 10'b0000100100; //w

#12 nty = 10'b0000111100; //n
    sty = 10'b0000000011; //w
    ety = 10'b0000100100; //s
    wty = 10'b0000010101; //e

#12 nty = 10'b0000100100; //w
    sty = 10'b0000110100; //n
    ety = 10'bz; //e
    wty = 10'b0000100111; //l

end


pipeline_two U0 (
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


endmodule
