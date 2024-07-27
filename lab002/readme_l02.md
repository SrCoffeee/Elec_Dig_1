# Laboratorio 002 
## Electrónica Digital 1

### Instalación de verilog 

En primer lugar procedemos con la instalación de verilog por medio de la consola con el comando:

---
    iverilog
---

De la siguiente manera:

![imagen](imagenes/instalacion_verilog.jpg)

En esta ocasión, ya se tenía instalado este lenguaje, por ende no es necesario seguir con los pasos de su instalación.

### Configuración de *udev*

Ahora procedemos a configurar el programador de la FPGA. *udev* es un sistema de espacio de usuario que permite al administrador del sistema operativo registrar controladores de espacio de usuario para eventos. 

Para ello seguiremos una serie de pasos:

1. Creamos una regla *udev* para el programador de la FPGA, incluyendo el siguiente código en la terminal:

---
    cd /
    cd etc/udev/rules.d/
---
Resultando:

![Creación de directorio](imagenes/udev.jpg)

2. Creamos en el directorio, un archivo llamado **51-usbblaster.rules** mediante el siguiente código:

---
    sudo touch 51-usbblaster.rules
---

Resultando:

![Creación de archivo 51-usbblaster.rules](imagenes/creaciondeusbblaster.jpg)

3. Ahora procedemos a insertar texto sugerido en la practica al archivo rules.d por medio del comando `sudo nano 51-usbblaster.rules`. 

![Texto en el rules.d](imagenes/textorules_d.jpg)


Implementación del sumador de 1 bit
-----------------------


### Funcionamiento en la FPGA

    [Aquí](https://youtu.be/tCylA9rU-R8) se muestra un video detallado del funcionamiento del sumador

Este laboratorio se centra en la implementación de un sumador de 1 bit utilizando Verilog. A continuación, se detalla el procedimiento paso a paso.

### Archivos proporcionados


1.  `sumador1bit.v`: Este archivo contiene la descripción del módulo `sumador1bit`, que implementa la lógica de un sumador de 1 bit.

2.  `sumador1bit_tb.v`: El archivo de banco de pruebas (`sumador1bit_tb.v`) se utiliza para verificar el funcionamiento del sumador. Contiene las entradas y salidas necesarias para simular el circuito.
   
### Descripción del módulo `sumador1bit`

El módulo `sumador1bit` tiene las siguientes características:

-   Entradas:

    -   `a`: Bit de entrada A.
    -   `b`: Bit de entrada B.
    -   `cin`: Bit de acarreo de entrada.
-   Salidas:

    -   `sum`: Resultado de la suma de los bits de entrada.
    -   `cout`: Bit de acarreo de salida.

La lógica combinacional se define de la siguiente manera:

```
assign sum = (a ^ b) ^ cin;
assign cout = (a & b) | (b & cin) | (cin & a);

```

### Procedimiento de simulación

1.  Inicialización de entradas: En el archivo `sumador1bit_tb.v`, se inicializan las entradas `a`, `b` y `cin` en diferentes momentos de tiempo. Por ejemplo:

    ```
    #10 a = 1'b0; b = 1'b0; cin = 1'b0;
    #90 a = 1'b0; b = 1'b1; cin = 1'b0;
    #90 a = 1'b1; b = 1'b1; cin = 1'b0;

    ```

2.  Simulación y finalización: La simulación se ejecuta hasta que se alcanza el tiempo especificado. En este caso, se utiliza `$finish()` para finalizar la simulación:

    ```
    #90 $finish();

    ```

3.  Archivo VCD: Se genera un archivo VCD (`top.gtkw`) que contiene las formas de onda de las señales simuladas.

### Uso del archivo VCD

Para visualizar las formas de onda se usó la herramienta de simulación GTKWave, importando el archivo `top.gtkw` y verificando las señales `sum` y `cout`.

