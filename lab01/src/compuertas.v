module compuertas (
input a,b,c,
output s1,s2,s3,s4
);

assign s1 = a | b ;
assign s2 = ~c;
assign s3 = a & b;
assign s4 = a ^ b;
endmodule

