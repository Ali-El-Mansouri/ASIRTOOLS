#!/bin/bash

# Funcion para comprobar la instalación de VirtualBox
function comprobar_instalacion {
    if dpkg -l | grep -q "virtualbox"; then
        echo "VirtualBox está instalado en el sistema."
        echo "Que deseas hacer? (actualizar/desinstalar/cancelar)"
        read accion

        case "$accion" in
            "actualizar")
                actualizar_virtualbox
                ;;
            "desinstalar")
                desinstalar_virtualbox
                ;;
            "cancelar")
                echo "Se ha cancelado la acción. No se realizará ninguna operación."
                ;;
            *)
                echo "Opción incorrecta. Por favor, verifica tu selección."
                ;;
        esac
    else
        echo "VirtualBox no esta instalado en el sistema."
        instalar_virtualbox
    fi
}

# Funcion para actualizar VirtualBox
function actualizar_virtualbox {
    sudo apt update
    sudo apt upgrade virtualbox -y
    echo "VirtualBox se ha actualizado correctamente."
}

# Función para desinstalar VirtualBox
function desinstalar_virtualbox {
    sudo apt remove virtualbox -y
    echo "VirtualBox se ha desinstalado correctamente."
}

# Funcion para instalar VirtualBox
function instalar_virtualbox {
    sudo apt install virtualbox -y
    echo "VirtualBox se ha instalado correctamente."
}

# Llamar a la función principal
comprobar_instalacion
