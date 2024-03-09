`timescale 1ps/1ps
module testbench();

reg a,b,c;
wire s1,s2,s3,s4 ;

  initial
  begin
	#1 a = 0; b = 0; c = 0 ;
	#100 a = 0; b = 1; c = 1 ; 
    #100 a = 1; b = 0; 
    #100 a = 1; b = 1;
    #100 $finish(); // [stop(), $finish()]
  end

compuertas compuertas (
    .a(a),
    .b(b),
    .c(c),
    .s1(s1),
    .s2(s2),
    .s3(s3),
    .s4(s4)
  );
  
wire co,s;  

sumador1bit m1 (
	.a(a),
	.b(b),
	.co(co),
	.s(s)
);

	initial 
	begin
	#1 		a = 1'b0;b = 1'b0;
	#100	a = 1'b0;b = 1'b1; 
	#100	a = 1'b1;b = 1'b0;
	#100	a = 1'b1;b = 1'b1;  
	#100 $finish(); // [stop(), $finish()]
end


initial
  begin
    $dumpfile("top.vcd");
    $dumpvars(0, testbench);
  end
  
 endmodule
  
