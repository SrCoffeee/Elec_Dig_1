`timescale 1ns / 1ps
module testbench;

   reg [3:0] a, b;      
   reg cin;
   wire [3:0] s;       
   wire cout4;


sumador4bit dut (
    .b(b),
    .a(a),
    .cin(cin),
    .s(s),
    .cout4(cout4)
);

// Inicialización de señales
  initial 
  begin
   	// Caso de prueba : 
    a = 4'b0010; b = 4'b0001; cin = 1'b0;
    #100 a = 4'b0110; b = 4'b0001; cin = 1'b0;
    $display("Suma = %b, cout = %b ", s,cout4);
    #100 a = 4'b1110; b = 4'b0001; cin = 1'b0;    
    $display("Suma = %b, cout = %b ", s,cout4);
    #100 a = 4'b1111; b = 4'b0001; cin = 1'b0;    
    $display("Suma = %b, cout = %b ", s,cout4);
   
    #100 $finish(); // [stop(), $finish()]
    
	end

initial
  begin
    $dumpfile("top.vcd");
    $dumpvars(0, testbench);
  end

endmodule
