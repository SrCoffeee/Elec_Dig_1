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


### Implementación del sumador de 1 bit


### Funcionamiento en la FPGA

    [Aquí](https://youtu.be/tCylA9rU-R8) se muestra un video detallado del funcionamiento del sumador

