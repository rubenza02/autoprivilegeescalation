#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
nc='\033[0m' # No color

echo -e "Este script ha sido creado por zunderrub"
echo -e "Si quereis aprender ciberseguridad y hacking etico os recomiendo que os paseis por mi canal de youtube @zunderrub"

sleep 2

echo -e "${yellow}Analizando posibles formas de escalar privilegios:${nc}"
echo -e "\n"

echo -e "\n"

echo -e "${yellow}Este es el id del sistema${nc}"

echo -e "\n"

id

echo -e "\n"

cd /home/
usuarios=$(ls)
echo -e "${yellow}Estos son los usuarios del sistema${nc}"
echo -e "\n"
echo $usuarios
echo -e "\n"

echo -e "${yellow}1. Verificando permisos de sudo${nc}"
if sudo -v >/dev/null 2>&1; then
    sudoers=$(sudo -l | tail -n 1)
    echo -e "Puedes ejecutar como ${red}root:${nc}\n$sudoers "
else
    echo -e "${red}No se pudo verificar los permisos de sudo.${nc} La contraseña puede ser incorrecta o no tienes permisos de sudo."
 fi

echo -e "\n"

echo -e "${yellow}Realizando el escaneo de binarios con el privilegio suid${nc}"

permisos=$(find / -perm -4000 2>/dev/null | tr '/' ' ' | awk '{print $NF}')


echo -e "Puedes ejecutar los siguientes binarios con permisos de ${red}suid:${nc}\n  $permisos"

echo -e "${yellow}Buscando tareas cron que se esten ejecutando en este momento${nc}"

cron=$(cat /etc/crontab | grep "^[0-9*]" )
echo -e "\n"
echo -e "${yellow}Las tareas cron que se estan ejecutando en el sistema son las siguientes${nc}\n $cron"
echo -e "\n"
echo -e "${yellow}Verificando los archivos que contiene el directorio tmp${nc}"
cd /tmp 
contenido=$(ls -la)
echo -e "Tenemos los siguientes archivos en ${red}tmp:${nc}\n$contenido"

echo -e "\n"

echo -e "${yellow}Verificando los archivos que contiene el directorio opt${nc}"
cd /opt 
contenidoopt=$(ls -la)

echo -e "Tenemos los siguientes archivos en ${red}opt:${nc}\n$contenidoopt"

echo -e "\n"

echo -e "${yellow}Escaneando procesos que se esten ejecutando en el sistema${nc}"
procesos=$(ps faux)
echo -e "Se han encontrado los siguientes procesos en ejecucion${red}tmp:${nc}\n$procesos"



