module cache_miss(
//flag,
clk,
cachemiss
//flagset
);
//input flag;
input clk;
output [9:0] cachemiss;
//output flagset;

//wire flag;
wire clk;
reg [9:0] cachemiss;
//reg flagset;

integer i;
reg [9:0] misslist [0:255];
//reg [9:0] counter;

always @ (posedge clk) begin
cachemiss = misslist[i];
i = i+1;
end

/*integer count;
integer i;
integer j;
integer k;
integer l;
integer m;
integer n;
integer o;
integer p;
integer q;
integer r;
integer s;*/

initial begin 

//count=0;
//flagset = 0;
i = 0;
misslist[0] = 10'b0111101101;
misslist[1] = 10'b0111110100;
misslist[2] = 10'b0111000000;
misslist[3] = 10'bz;
misslist[4] = 10'b0111001110;
misslist[5] = 10'b0111101101;
/*counter = 10'b1111111111;
#60 $monitor("%g  \t %b  %d   ",$time, cachemiss, r);
for (i = 0; i<2 ; i = i+1) begin
 counter[9] = ~counter[9];
 for (j = 0; j<2; j = j+1) begin
  counter[8] = ~counter[8];
  for (k = 0; k<2 ; k = k+1) begin
   counter[7] = ~counter[7];
   for (l = 0; l<2 ; l = l+1) begin
    counter[6] = ~counter[6];
    for (m = 0; m<2 ; m = m+1) begin
     counter[5] = ~counter[5];
     for (n = 0; n<2	; n = n+1) begin
      counter[4] = ~counter[4];
      for (o = 0; o<2 ; o = o+1) begin
       counter[3] = ~counter[3];
       for (p = 0; p<2 ; p = p+1) begin
	counter[2] = ~counter[2];
	for (q = 0; q<2 ; q = q+1) begin
	 counter[1] = ~counter[1];
	 for (r = 0; r<2 ; r = r+1) begin
	  count = count+1;
	  if(r == 0) begin
	   #5 cachemiss[0] = 1'b1;
	  end else if (r == 1) begin
	   #5 cachemiss[0] = 1'b0;
          misslist[count] = cachemiss;
          end		
	 end
	end
       end
      end
     end
    end
   end
  end
 end
end
#500 $finish;*/
end

/*always @ (flag)
if (flag === 1) begin
	for(s = 0; s < 255; s=s + 1) begin  
		cachemiss = misslist[s];
		flagset = 0; 
	end
end*/
endmodule