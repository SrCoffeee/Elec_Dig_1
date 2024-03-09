// Declaración del módulo
module sumador1bit (
  input a,b, // entradas
  output co, s // co = carry out , s = salida
);



// Descripción del comportamiento
assign s = a ^ b; 
assign co = a & b; 

endmodule
