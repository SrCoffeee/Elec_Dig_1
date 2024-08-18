module bintobcd ( // modulo para obtener las unidades/decenas/centenas/miles del counter_1 del modulo tiempos
  input [13:0] bitIn, 	// valor del contador; viene del modulo tiempos
  output[3:0] bcdunits, //salida de las unidades
  output[3:0] bcdtens,	//ssalida de la decenas
  output[3:0] bcdcents,	//salida de las centenas
  output[3:0] bcdmils	//salida de los miles 
);
 assign bcdmils  = bitIn / 1000;
 assign bcdcents = (bitIn % 1000) / 100; 
 assign bcdtens  = (bitIn / 10) % 10;
 assign bcdunits = bitIn % 10;
  

endmodule
