#!/bin/bash

sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

pass=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')
sudo useradd -m -s /bin/bash -p "$pass" -G p1c2_2024_gAlumno p1c2_2024_A1
sudo useradd -m -s /bin/bash -p "$pass" -G p1c2_2024_gAlumno p1c2_2024_A2
sudo useradd -m -s /bin/bash -p "$pass" -G p1c2_2024_gAlumno p1c2_2024_A3
sudo useradd -m -s /bin/bash -p "$pass" -G p1c2_2024_gProfesores p1c2_2024_P1

sudo chown p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo su - p1c2_2024_A1 -c "sudo whoami > /Examenes-UTN/alumno_1/validar.txt"
sudo chmod 750 /Examenes-UTN/alumno_1

sudo chown p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo su - p1c2_2024_A2 -c "sudo whoami > /Examenes-UTN/alumno_2/validar.txt"
sudo chmod 760 /Examenes-UTN/alumno_2

sudo chown p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo su - p1c2_2024_A3 -c "sudo whoami > /Examenes-UTN/alumno_3/validar.txt"
sudo chmod 700 /Examenes-UTN/alumno_3

sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo su - p1c2_2024_P1 -c "sudo whoami > /Examenes-UTN/profesores/validar.txt"
sudo chmod 775 /Examenes-UTN/profesores
