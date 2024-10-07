#!/bin/bash
ruta=~/repogit/UTNFRA_SO_1P2C_2024_Gimenez/RTA_ARCHIVOS_Examen_20241007/filtro_basico.txt
sudo cat /proc/meminfo | grep MemTotal > "$ruta"
echo "Chassis Information" >> "$ruta"
sudo dmidecode -t chassis | grep Manufacturer >> "$ruta"
