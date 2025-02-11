#!/bin/bash

# Función para verificar si Nmap está instalado en el sistema
function ComprobarNmap {
    # Verificar si Nmap está instalado utilizando dpkg
    if dpkg -l | grep -q "nmap"; then
        echo "Nmap está instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar Nmap
        read -p "Que desea hacer? (Actualizar/Desinstalar/Cancelar): " Accion

        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        Accion=$(echo "$Accion" | tr '[:upper:]' '[:lower:]')

        # Ejecutar la accion seleccionada por el usuario
        case $Accion in
            actualizar)
                sudo apt update
                sudo apt upgrade nmap -y
                echo "Nmap se ha actualizado correctamente."
                ;;
            desinstalar)
                sudo apt remove nmap -y
                echo "Nmap se ha desinstalado correctamente."
                ;;
            cancelar)
                echo "Se ha cancelado la acción. No se realizará ninguna operación."
                ;;
            *)
                echo "Opción incorrecta. Por favor, compruebe su selección."
                ;;
        esac
    else
        echo "Nmap no esta instalado en el sistema."

        # Instalación de Nmap
        sudo apt update
        sudo apt install nmap -y
        echo "Nmap se ha instalado correctamente."
    fi
}

# Llamar a la función para verificar si Nmap está instalado
ComprobarNmap
