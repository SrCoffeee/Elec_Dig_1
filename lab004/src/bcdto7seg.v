module bcdto7seg (BCD, SSeg); //modulo generico para un 7segmentos
  input [3:0] BCD;
  //input BCD;
  output reg [0:6] SSeg;
  reg [3:0]bcd_int  = 4'b0000;

always @ ( * ) begin
  case (BCD)
                    // abcdefg
     0: SSeg = 7'b0000001; // "0"  
	 1: SSeg = 7'b1001111; // "1" 
	 2: SSeg = 7'b0010010; // "2" 
	 4'd3: SSeg = 7'b0000110; // "3" 
	 4'd4: SSeg = 7'b1001100; // "4" 
	 4'd5: SSeg = 7'b0100100; // "5" 
	 4'd6: SSeg = 7'b0100000; // "6" 
	 4'd7: SSeg = 7'b0001111; // "7" 
	 4'd8: SSeg = 7'b0000000; // "8"  
	 4'd9: SSeg = 7'b0000100; // "9" 
		4'd10: SSeg = 7'b0001000; // "A"
		4'd11: SSeg = 7'b1100000; // "b"
		4'd12: SSeg = 7'b0110001; // "C"
		4'd13: SSeg = 7'b1000010; // "d"
		4'd14: SSeg = 7'b0110000; // "E"
		4'd15: SSeg = 7'b0111000; // "F"
    default:
    SSeg = 7'b1111110;
  endcase
end
endmodule
