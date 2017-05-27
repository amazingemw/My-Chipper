module ha(a, b, sum, carry);

input a;

input b;

output sum;

output carry;

assign carry=a&b;                           //This is same as and(carry,a,b)

assign sum=a^b;           //                  ?This is same as xor(sum,a,b)

endmodule