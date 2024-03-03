# lab00

## Instalación de linux

Para un buen desarrollo de la asignatura, se realizara una instación del sistema operativo linux, con su distribución Mint basada en debian.

Para ello, se realizará una cierta cantidad de pasos:

1. Descargamos el archivo .ISO correspondiente a nuestra distrución o sistema operativo. En nuestro caso, usamos esta [pagina](https://www.linuxmint.com/download.php)

2. Booteamos nuestro sistema operativo en la unidad escogida con ayuda de algún software de booteo. En esta ocasión se realizó en una memoria USB y nos apoyamos del software [rufus](https://rufus.ie/es/)

3. Por medio del administrador de discos de Windows, se le asigna un espacio libre para la ejecución de linux.

4. Con la unidad booteada e insertada, reiniciamos el PC y antes de que se inicie nuevamente, apretamos repetídamente la tecla **F12** para seleccionar la unidad de arranque.

    - Seleccionamos la unidad donde tengamos instalado linux. En nuestro caso, la memoria.
5. Seleccionamos el iniciar Linux Mint, en el gestor de arranque.

![Imagen](https://linuxmint-installation-guide.readthedocs.io/es/latest/_images/grub-efi.png)

6. Una vez inicializado Linux Mint, abrimos el instalador del sistema operativo.

    - Cuando lleguemos a la opción de seleccionar lugar de instalación, ubicamos la opción *"Mas opciones"*.

    ![Particiones](https://www.linuxirun.com/5-Tutoriales/Z-Forum/3-Disco-2-EFI/EFI-04.jpg)

    - Creamos ubicamos el espacio libre que asignamos en el paso 3 y generamos dos particiones, la **swap** asignandole un espacio del 10% del libre y la **raiz** con el espacio disponible.

    - Seguimos los pasos pedidos por el instalador para finalizar la instalación.

7. Una vez finalizada la instalación, reiniciamos el PC y retiramos la unidad booteable.

8. Finalmente seleccionamos en nuestro nuevo menú de arranque, el sistema operativo Linux y eso seria todo.
		
## Instalacion de Quartus
Para la instación de Quartus seguiremos una serie de pasos:
1. En una primera instacia, descargamos el instalador que lo podemos enccontrar mediante el siguiente [enlace](https://www.intel.la/content/www/xl/es/products/details/fpga/development-tools/quartus-prime/resource.html)
   
2. Una vez descargado el archivo .run, ubicamos el lugar de descarga y abrimos la terminal en este lugar.

3. Ejecutamos los siguientes códigos en la terminal:
---
    chmod +x qinst-lite-linux-23.1std-991.run 
---
4. Posteriormente ejecutamos en siguiente códgigo
---
    ./qinst-lite-linux-23.1std-991.run 
---
5. Esperamos que se ejecute el instalador, seguimos las instrucciones  y finalizamos la instalación.

6. Si no se crea un acceso directo al finalizar, se puede realizar de forma manual como lo hicimos de la siguiente forma:
   -  Abrimos la terminal y ejecutamos el siguiente código:
     ---
         export ALTERAPATH="/home/charlie/intelFPGA_lite/23.1std/"
	     export QUARTUS_ROOTDIR=${ALTERAPATH}/quartus
	     export QUARTUS_ROOTDIR_OVERRIDE="$QUARTUS_ROOTDIR"
	     export PATH=$PATH:${ALTERAPATH}/quartus/sopc_builder/bin
	     export PATH=$PATH:${ALTERAPATH}/nios2eds/bin
	     export PATH=$PATH:${QSYS_ROOTDIR}
     ---
     
   -  Posteriormente introducimos este códgio a la terminal:
     ---
         #export QSYS_ROOTDIR="/home/charlie/intelFPGA_lite/23.1std/quartus/sopc_builder/bin"
     ---
   -  Seguido introducimos el siguiente código, también en la términal:
     ---
     	 sudo ln -s $QUARTUS_ROOTDIR/bin/quartus /bin/quartus
     ---
   - Finalmente para ejecutar el programa, ejercutamos en comando *quartus* en la terminal y finalizariamos el proceso

   ![quartus](https://i.ytimg.com/vi/_jc3ezjDycs/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYACygWKAgwIABABGGUgZShlMA8=&rs=AOn4CLAb6FEBYNo-wZTjV3nRVDXeq6s_yg)
## Instalación de Questa
