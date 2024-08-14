# Proyecto: Display de 7 Segmentos y Sumador de 4 Bits con FPGA

Este proyecto demuestra cómo implementar un display de 7 segmentos y un sumador de 4 bits utilizando una FPGA. A continuación, se detallan los pasos para realizar este proyecto.

## Tabla de Contenidos
1. Introducción
2. Materiales Necesarios
3. Configuración del Entorno
4. Diseño del Sumador de 4 Bits
5. Implementación del Display de 7 Segmentos
6. Integración y Simulación
7. Conclusiones

## Introducción
Este proyecto tiene como objetivo mostrar cómo se puede utilizar una FPGA para implementar un sumador de 4 bits y mostrar el resultado en un display de 7 segmentos. Utilizaremos el lenguaje Verilog para describir el hardware.

## Materiales Necesarios
- FPGA (por ejemplo, Altera DE2-115)
- Software de desarrollo (por ejemplo, Quartus II)
- Display de 7 segmentos

## Configuración del Entorno
1. **Instalar el software de desarrollo**: Descarga e instala Quartus II o el software de desarrollo compatible con tu FPGA.
2. **Configurar el proyecto**: Crea un nuevo proyecto en Quartus II y selecciona el modelo de tu FPGA.

## Diseño del Sumador de 4 Bits
1. **Crear el archivo Verilog**: Crea un nuevo archivo Verilog para el sumador de 4 bits.
2. **Definir el módulo**:
    ```verilog
    module sumador4bit(
        input [3:0] a,
        input [3:0] b,
        input cin,
        output [3:0] s,
        output cout4
    );
        // Declaración de cables
        wire cout1, cout2, cout3;

        // Instanciación de los sumadores de 1 bit en secuencia
        sumador1bit sum0 (a[0], b[0], cin,   s[0], cout1);
        sumador1bit sum1 (a[1], b[1], cout1, s[1], cout2);
        sumador1bit sum2 (a[2], b[2], cout2, s[2], cout3);
        sumador1bit sum3 (a[3], b[3], cout3, s[3], cout4);
    endmodule
    ```

## Implementación del Display de 7 Segmentos
1. **Crear el archivo Verilog**: Crea un nuevo archivo Verilog para el controlador del display de 7 segmentos.
2. **Definir el módulo**:
    ```verilog
    module Display7Segmentos (
        input [3:0] BIN,
        output reg [6:0] SEG
    );
        always @(*) begin
            case (BIN)
                4'b0000: SEG = 7'b0000001; // 0
                4'b0001: SEG = 7'b1001111; // 1
                4'b0010: SEG = 7'b0010010; // 2
                4'b0011: SEG = 7'b0000110; // 3
                4'b0100: SEG = 7'b1001100; // 4
                4'b0101: SEG = 7'b0100100; // 5
                4'b0110: SEG = 7'b0100000; // 6
                4'b0111: SEG = 7'b0001111; // 7
                4'b1000: SEG = 7'b0000000; // 8
                4'b1001: SEG = 7'b0000100; // 9
                default: SEG = 7'b1111111; // Error
            endcase
        end
    endmodule
    ```

## Integración y Simulación
1. **Crear el archivo de top-level**: Crea un archivo Verilog que integre el sumador y el display.
    ```verilog
    module TopLevel (
        input [3:0] a,
        input [3:0] b,
        input cin,
        output [6:0] SEG,
        output cout4
    );
        wire [3:0] s;

        sumador4bit U1 (
            .a(a),
            .b(b),
            .cin(cin),
            .s(s),
            .cout4(cout4)
        );

        Display7Segmentos U2 (
            .BIN(s),
            .SEG(SEG)
        );
    endmodule
    ```

2. **Añadir el módulo FPGA**:
    ```verilog
    module FPGA(
        input [3:0] a,
        input [3:0] b,
        // input cin,
        output wire [0:6] seg,
        output [3:0] an,
        output coutt
    );
        wire cin = 0;
        wire [3:0] s;
        wire cout;

        assign an = 4'b1110;
        sumador4bit sum (a, b, cin, s, cout);
        BCDtoSSeg segm (s, seg);
        assign coutt = !cout;
    endmodule
    ```

3. **Simular el diseño**: Utiliza el simulador de Quartus II para verificar el funcionamiento del diseño.

## Conclusiones
Este proyecto demuestra cómo se puede utilizar una FPGA para implementar un sumador de 4 bits y mostrar el resultado en un display de 7 segmentos. La utilización de Verilog permite una descripción clara y estructurada del hardware, facilitando el diseño y la simulación.

## Video de demostración

https://youtu.be/0QX5yv_ZxeQ?feature=shared link demostración 7-segmentos + sumador4bit en FPGA
