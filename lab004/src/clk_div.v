module clk_div(clk, rst, fdiv_1,fdiv_2,fdiv_3,fdiv_4);// modulo para dividir la frecuencia del cristal oscilatorio de 50M

input clk; // clock de entrada 
input rst; // boton de reset
output reg fdiv_1; //clock de salida 1hz
output reg fdiv_2;//clock de salida  10hz
output reg fdiv_3;//clock de salida	100hz
output reg fdiv_4;//clock de salida	1000hz

parameter LIM_1 = 26'd25000000; // limite a contar (1hz=1s)
parameter LIM_2 = 26'd2500000;// 10hz = 0,1s = 100ms
parameter LIM_3 = 26'd250000;// 100hz = 0,01s = 10ms
parameter LIM_4 = 26'd25000;// 1000hz = 0,001s = 1ms

parameter SIZE = $clog2(LIM_1);  //tamaño de 

reg [SIZE-1:0] counter_1; 	// declaracion del counter 1 a partir de LIM 
reg [SIZE-1:0] counter_2;	// declaracion del  counter 2 a partir de LIM
reg [SIZE-1:0] counter_3;	// declaracion del  counter 3 a partir de LIM
reg [SIZE-1:0] counter_4;	// declaracion del  counter 4 a partir de LIM

always @(posedge clk) begin  	// ciclo divisor 1
    if (counter_1 == LIM_1) begin 
        counter_1 <= 'd0;
        fdiv_1 <= ~fdiv_1;
    end else begin
    counter_1 <= counter_1+1;
    end
end

always @(posedge clk) begin  // ciclo divisor 2
    
    if (counter_2 == LIM_2) begin 
        counter_2 <= 'd0;
        fdiv_2 <= ~fdiv_2;
    end else begin
    counter_2 <= counter_2+1;
    end
end
always @(posedge clk) begin  // ciclo divisor 3
    
     if (counter_3 == LIM_3) begin 
        counter_3 <= 'd0;
        fdiv_3 <= ~fdiv_3;
    end else begin
    counter_3 <= counter_3+1;
    end
end

always @(posedge clk) begin  // ciclo divisor 4
    
     if (counter_4 == LIM_4) begin 
        counter_4 <= 'd0;
        fdiv_4 <= ~fdiv_4;
    end else begin
    counter_4 <= counter_4+1;
    end
end
endmodule
