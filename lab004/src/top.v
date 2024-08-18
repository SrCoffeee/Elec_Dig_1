module top ( //modulo principal que gestiona los otros modulos 
input clk,	//clock de entrada 50M PIN23
input rst,	// boton de reset PIN86
input [3:0]select, // botones de seleccion de segundos/decimas/centesimas/milesimas pines 58,59,60,64
output reg [0:6]seg,//numero a pintar en el 7segmentos 
output reg [3:0] an //salida que selecciona cual de los 7segmentos activar
);


wire clk_1hz,clk_10hz,clk_100hz,clk_1000hz; //declaracion interna de los clk de salidasdel  modulo divisor 

clk_div clk_div ( //instanciamiento del modulo divisor de frecuencias
.clk(clk),
.rst(rst),
.fdiv_1(clk_1hz), 
.fdiv_2(clk_10hz),
.fdiv_3(clk_100hz),
.fdiv_4(clk_1000hz)
);

wire [13:0] cronometro_s; //variable interna para guardar la cuenta del modulo t_1
 reg clk_seleccionado;  //variable interna para guardar la frecuencia seleccionada

always@(*) begin  //ciclo que selecciona la frecuencia deseada dependiendo del boton select
	case (select) 
		4'b0001 : clk_seleccionado <= clk_1hz;
		4'b0010 : clk_seleccionado <= clk_10hz;
		4'b0100 : clk_seleccionado <= clk_100hz;
		4'b1000 : clk_seleccionado <= clk_1000hz;
		default : clk_seleccionado <= 0;
	endcase
end

tiempos t_1 (clk_seleccionado,rst,cronometro_s); //instanciamiento del modulo tiempos 

wire [3:0] btbcd_u; // cable para las unidades
wire [3:0] btbcd_d;	// cable para las decenas
wire [3:0] btbcd_c;	// cable para las centenas
wire [3:0] btbcd_m;	// cable para los miles

bintobcd btbcd_1 (cronometro_s,btbcd_u,btbcd_d,btbcd_c,btbcd_m); // instanciamiento del modulo que calcula las u/d/c/m 
																// y las direcciona a los cables btbcd_ 
wire [0:6] seg_u; //cable para pintar las unidades
wire [0:6] seg_d;	//cable para pintar las decenas 
wire [0:6] seg_c;	//cable para pintar las centenas 
wire [0:6] seg_m;	//cable para pintar los miles



bcdto7seg sseg_u (btbcd_u,seg_u); // instanciamiento del modulo 7segmentos para pintar las unidades y direcciona a seg_u
bcdto7seg sseg_d (btbcd_d,seg_d);	// instanciamiento del modulo 7segmentos para pintar las decenas y direcciona a seg_d
bcdto7seg sseg_c (btbcd_c,seg_c);	// instanciamiento del modulo 7segmentos para pintar las centenas y direcciona a seg_c
bcdto7seg sseg_m (btbcd_m,seg_m);	// instanciamiento del modulo 7segmentos para pintar los miles y direcciona a seg_m

 reg [1:0]rotar_an ; // variable para rotar la activacion de cada 7segmentos  


always @(posedge clk_1000hz ) begin //ciclo que pinta el contador completo, rotando los 7segmentos con sus respectivas u/d/c/m
	case(rotar_an)
		2'd0 : begin an = 4'b1110 ; seg <= seg_u ; rotar_an <= rotar_an +1 ; end
		2'd1 : begin an = 4'b1101 ; seg <= seg_d ; rotar_an <= rotar_an +1 ; end 
		2'd2 : begin an = 4'b1011 ; seg <= seg_c ; rotar_an <= rotar_an +1 ; end
		2'd3 : begin an = 4'b0111 ; seg <= seg_m ;rotar_an <= rotar_an +1 ; end
		default : an <= 4'b1111;
		endcase
end


endmodule
