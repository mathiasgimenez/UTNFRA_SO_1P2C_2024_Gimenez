#!/bin/bash
ruta=~/repogit/UTNFRA_SO_1P2C_2024_Gimenez/RTA_ARCHIVOS_Examen_20241007/Filtro_Avanzado.txt
echo "mi IP Publica es: $(curl -s ifconfig.me)" > "$ruta"
echo "Mi usuario es: $(whoami)" >> "$ruta"
echo "El Hash de mi Usuario es:  $(sudo grep $(whoami) /etc/shadow | awk -F ':' '{print $2}')" >> "$ruta"
echo "La URL de mi repositorio es: $(git remote get-url origin)" >> "$ruta"
