#!/bin/bash

# Función para comprobar la instalación de Visual Studio Code
function comprobar_instalacion {
    if dpkg -l | grep -q "code"; then
        echo "Visual Studio Code esta instalado en el sistema."
        echo "Que deseas hacer? (actualizar/desinstalar/cancelar)"
        read accion

        case "$accion" in
            "actualizar")
                actualizar_visual_studio_code
                ;;
            "desinstalar")
                desinstalar_visual_studio_code
                ;;
            "cancelar")
                echo "Se ha cancelado la accion. No se realizará ninguna operacion."
                ;;
            *)
                echo "Opción incorrecta. Por favor, verifica tu seleccion."
                ;;
        esac
    else
        echo "Visual Studio Code no esta instalado en el sistema."
        instalar_visual_studio_code
    fi
}

# Función para actualizar Visual Studio Code
function actualizar_visual_studio_code {
    sudo apt update
    sudo apt upgrade code -y
    echo "Visual Studio Code se ha actualizado correctamente."
}

# Función para desinstalar Visual Studio Code
function desinstalar_visual_studio_code {
    sudo apt remove code -y
    echo "Visual Studio Code se ha desinstalado correctamente."
}

# Función para instalar Visual Studio Code
function instalar_visual_studio_code {
    sudo apt install code -y
    echo "Visual Studio Code se ha instalado correctamente."
}

# Llamar a la función principal
comprobar_instalacion
