module tiempos(// modulo que cuenta el numero de segundos/decimas/centesimas/milesimas transcurridos dependiendo del clk correspondiente
input clk,
input rst,
output reg [SIZE-1:0] counter_1
);
parameter LIM_1 = 10000; //limite a contar 9999
parameter SIZE = $clog2(LIM_1);// # de bits del limite a contar
//reg [SIZE-1:0] counter_1; // declaracion del tamaño en bits del counter a partir de LIM

always @(posedge clk) begin  
    if(~rst) begin			//reinicia el contador a 0 cuando se pulsa el reset
        counter_1 <= 0;
    end else if (counter_1 == LIM_1) begin // reinicia el contador a 0 cuando llega al limite
        counter_1 <= 0;
    end else begin
    counter_1 <= counter_1+1;  // aumenta el contador en 1 previamente evaluadas las condiciones anteriores
    end	 
end
endmodule
