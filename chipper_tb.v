module chipper_tb();

reg [6:0] inc;
reg nsig;
reg ssig;
reg esig;
reg wsig;
//reg lsig;
reg clksig;              //To be taken into master module
reg clk;
wire [9:0] nout;
wire [9:0] sout;
wire [9:0] eout;
wire [9:0] wout;
wire [9:0] lout;

always begin
#6 clk = ~clk;
end

initial begin

    nsig = 0;
    ssig = 0;
    esig = 0;
    wsig = 0;
//    lsig = 0; 
    clk = 0;	 
	
#2  inc  = 7'bz;
    nsig = 1;	
#2  nsig = 0;	
    inc  = 7'b0000101;
    ssig = 1;	
#2  ssig = 0;	
    inc  = 7'b1100001;
    esig = 1;
#2  esig = 0;	
    inc  = 7'b0100100;
    wsig = 1;	
/*#2  wsig = 0;	
    inc  = 7'b0100111; //l
    lsig = 1;	*/

#2  wsig = 0; //lsig = 0;
    inc  = 7'b1100100; //l
    nsig = 1;
#2  nsig = 0;	
    inc  = 7'b0111111; //e
    ssig = 1;
#2  ssig = 0;	
    inc  = 7'b0101100; //n
    esig = 1;
#2  esig = 0;	
    inc  = 7'b0011100; //w
    wsig = 1;
/*#2  wsig = 0;	
    inc  = 7'b0101100; //l
    lsig = 1;	*/	

#2  wsig = 0; //lsig = 0;
    inc  = 7'b0100110; //e
    nsig = 1;
#2  nsig = 0;	
    inc  = 7'b0000001; //w
    ssig = 1;
#2  ssig = 0;	
    inc  = 7'b1101100; //l
    esig = 1;
#2  esig = 0;	
    inc  = 7'b0100100; //w
    wsig = 1;	
/*#2  wsig = 0;	
    inc  = 7'b0001000; //l
    lsig = 1;	*/

#2  wsig = 0; //lsig = 0;
    inc  = 7'b0111100; //n
    nsig = 1;
#2  nsig = 0;	
    inc  = 7'b0000011; //w
    ssig = 1;
#2  ssig = 0;	
    inc  = 7'b0100100; //s
    esig = 1;
#2  esig = 0;	
    inc  = 7'b0010101; //e
    wsig = 1;
/*#2  wsig = 0;	
    inc  = 7'b0000001; //l
    lsig = 1;	*/

#2  wsig = 0; //lsig = 0;
    inc  = 7'b0100100; //w
    nsig = 1;
#2  nsig = 0;	
    inc  = 7'b0110100; //n
    ssig = 1;
#2  ssig = 0;	
    inc  = 7'bz; //e
    esig = 1;
#2  esig = 0;	
    inc  = 7'b0100111; //l
    wsig = 1;
/*#2  wsig = 0;	
    inc  = 7'b0010111; //l
    lsig = 1;	*/
#2  wsig = 0; //lsig = 0;
    clksig = 1;
#1  clksig = 0; 	

end


chipper U0 (
.inc(inc),
.nsig(nsig),
.ssig(ssig),
.esig(esig),
.wsig(wsig),
//.lsig(lsig),
.clksig(clksig),
.clk(clk),
.cachemiss(),
.nout(nout),
.sout(sout),
.eout(eout),
.wout(wout),//,
.lout(lout)
);


endmodule
