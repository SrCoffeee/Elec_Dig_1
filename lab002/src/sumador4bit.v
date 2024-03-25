module sumador4bit(
// declaracion de entradas y salidas
input [3:0] a,
input [3:0] b,
input cin,
output [3:0] s,
output cout4
);
// declaracion de cables 
wire cout1,cout2,cout3;

// instanciacion de los sumadores de 1 bit en secuencia

sumador1bit sum0 (a[0], b[0], cin,   s[0], cout1);
sumador1bit sum1 (a[1], b[1], cout1, s[1], cout2);
sumador1bit sum2 (a[2], b[2], cout2, s[2], cout3);
sumador1bit sum3 (a[3], b[3], cout3, s[3], cout4);

endmodule
