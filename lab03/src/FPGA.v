module FPGA(
input [3:0]a,
input[3:0]b,
//input cin ,
output wire [0:6] seg,
output [3:0] an ,
output coutt
);
wire cin=0;
wire [3:0]s;
wire cout;

assign an = 4'b1110;
sumador4bit sum (a, b, cin, s, cout);
BCDtoSSeg segm (s, seg);
assign coutt = !cout;
endmodule





