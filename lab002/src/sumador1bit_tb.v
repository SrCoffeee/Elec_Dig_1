`timescale 1ns / 1ps
module testbench;
     // entrdas
     reg a;
     reg b;
     reg cin;
     // salidas
     wire sum;
     wire cout;
   
     // instancia del primer sumador 
      sumador1bit sum1 (
      .a(a), 
      .b(b), 
      .cin(cin), 
      .sum(sum), 
      .cout(cout)
      );

     initial begin
      // Inicializacion de entradas
      #10 a = 1'b0; b = 1'b0; cin = 1'b0;
      #90 a = 1'b0; b = 1'b1; cin = 1'b0;
      #90 a = 1'b1; b = 1'b1; cin = 1'b0;
      #90 $finish(); // [stop(), $finish()]
          
     end   
   
     
     initial
  begin
    $dumpfile("top.vcd");
    $dumpvars(0, testbench);
  end
        
    endmodule


