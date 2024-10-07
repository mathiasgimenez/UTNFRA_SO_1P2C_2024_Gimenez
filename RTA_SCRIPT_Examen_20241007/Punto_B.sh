#!/bin/bash
(
        # crea 3 particiones primarias de 1GB
        for i in {1..3}; do
                echo n
                echo p
                echo
                echo
                echo +1G
        done

        # crea una particion extendida que ocupa todo el espacio disponible del disco (7GB)
        echo n
        echo e
        echo
        echo

        # crea 7 particiones logicas de 1GB
        for i in {5..11}; do
                echo n
                echo
                echo +1G
        done

        # salir
        echo w
) | sudo fdisk /dev/sdb

# formateo de las particiones menos la particion 4 (la extendida)
for i in {1..11}; do
        if [ $i -ne 4 ]; then
                sudo mkfs -t ext4 /dev/sdb$i
        fi
done

# montar las partices en el directorio echo en el punto A
cont=1
for i in {1..3}; do
        for j in {1..3}; do
                if [ $cont -eq 4 ]; then
                        cont=$((cont + 1))
                fi
                sudo mount /dev/sdb$cont /Examenes-UTN/alumno_$i/parcial_$j
                echo "/dev/sdb$cont /Examenes-UTN/alumno_$i/parcial_$j ext4 defaults 0 0" | sudo tee -a /etc/fstab
                cont=$((cont + 1))
        done
done

# Montar la ultima particion en el directorio de profesores
sudo mount /dev/sdb11 /Examenes-UTN/profesores
echo "/dev/sdb11 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab

