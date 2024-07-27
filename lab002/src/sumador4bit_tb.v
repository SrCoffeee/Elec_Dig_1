`timescale 1ns / 1ps
module testbench;
		// inicializamos entradas 
   reg [3:0] a, b;      
   reg cin =0;
   wire [3:0] s;       
   wire cout4;

//instanciamos modulos 

// modulo del sumador 4 bits
sumador4bit dut (
    .b(b),
    .a(a),
    .cin(cin),
    .s(s),
    .cout4(cout4)
);

wire [0:6] Sseg;

//modulo responsable del 7-segmentos

BCDtoSSeg dut2 (
	s,
	Sseg
);


// Damos valores iniciales a las entradas para que los modulos produzcan salidas
 initial begin
        // Caso 1
        #100 a = 4'b0000; b = 4'b0000; cin = 1'b0;  // a = 0, b = 0, resultado = 0, Resultado_en_binario = 0000
        #101 $display("a = %b, b = %b, Suma = %b, cout = %b", a, b, s, cout4);

        // Caso 2
        #100 a = 4'b0001; b = 4'b0000; cin = 1'b0;  // a = 1, b = 0, resultado = 1, Resultado_en_binario = 0001
        #101 $display("a = %b, b = %b, Suma = %b, cout = %b", a, b, s, cout4);

        // Caso 3
        #100 a = 4'b0010; b = 4'b0011; cin = 1'b0;  // a = 2, b = 3, resultado = 5, Resultado_en_binario = 0101
        #101 $display("a = %b, b = %b, Suma = %b, cout = %b", a, b, s, cout4);

        // Caso 4
        #100 a = 4'b1111; b = 4'b0001; cin = 1'b0;  // a = 15, b = 1, resultado = 16, Resultado_en_binario = 0000, cout = 1
        #101 $display("a = %b, b = %b, Suma = %b, cout = %b", a, b, s, cout4);

        // Caso 5
        #100 a = 4'b1111; b = 4'b1111; cin = 1'b0;  // a = 15, b = 15, resultado = 30, Resultado_en_binario = 1110, cout = 1
        #101 $display("a = %b, b = %b, Suma = %b, cout = %b", a, b, s, cout4);

        // Caso 6
        #100 a = 4'b1111; b = 4'b1110; cin = 1'b0;  // a = 15, b = 14, resultado = 29, Resultado_en_binario = 1110, cout = 1
        #101 $display("a = %b, b = %b, Suma = %b, cout = %b", a, b, s, cout4);

        // Caso 7
        #100 a = 4'b0101; b = 4'b1010; cin = 1'b0;  // a = 5, b = 10, resultado = 15, Resultado_en_binario = 1111
        #101 $display("a = %b, b = %b, Suma = %b, cout = %b", a, b, s, cout4);

        // Caso 8
        #100 a = 4'b1100; b = 4'b0011; cin = 1'b0;  // a = 12, b = 3, resultado = 15, Resultado_en_binario = 0000, cout = 0
        #101 $display("a = %b, b = %b, Suma = %b, cout = %b", a, b, s, cout4);
	
	
	
	
	
	
	
    #100 $finish(); // [stop(), $finish()]
    
	end

initial
  begin
    $dumpfile("top.vcd");
    $dumpvars(0, testbench);
  end

endmodule
