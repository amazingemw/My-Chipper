module chipper_tb();

reg [9:0] northad;  
reg [9:0] southad; 
reg [9:0] eastad; 
reg [9:0] westad;
reg clk;
reg [9:0] lin;
wire [9:0] nad;
wire [9:0] sad;
wire [9:0] ead;
wire [9:0] wad;
wire [9:0] lad;

always begin              //Clock generator
#2 clk=~clk;
end

initial begin
    clk=0;
    northad = 10'b0000000000;
    southad = 10'b0000000101;
    eastad  = 10'b1000100001;
    westad  = 10'b0000100100;
    lin     = 10'b0000101101;

#4  northad = 10'b1000100100; //l
    southad = 10'b0000111111; //e
    eastad  = 10'b0000101100; //n
    westad  = 10'b0000011100; //w
    lin     = 10'b0000101101;	

#4  northad = 10'b0000100110; //e
    southad = 10'b0000000001; //w
    eastad  = 10'b1000101100; //l
    westad  = 10'b0000100100; //w
    lin     = 10'b0000101000;	

#4  northad = 10'b0000111100; //n
    southad = 10'b0000000011; //w
    eastad  = 10'b0000100100; //s
    westad  = 10'b0000010101; //e
    lin     = 10'b0000001010;

#4  northad = 10'b0000100100; //w
    southad = 10'b0000110100; //n
    eastad  = 10'b0000000000; //e
    westad  = 10'b0000100111; //l
    lin     = 10'b0000111010;

#4 $finish;
end


chipper U0 (
.nin(northad),
.sin(southad),
.ein(eastad),
.win(westad),
.clk(clk),
.lin(lin),
.nout(nad),
.sout(sad),
.eout(ead),
.wout(wad),
.lout(lad)
);

/*cache_miss U1 (
.flag(flag),
.cachemiss(lin),
.flagset(flagset)
);*/

endmodule
