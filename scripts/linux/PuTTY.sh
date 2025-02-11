#!/bin/bash

# Función para verificar si PuTTY está instalado en el sistema
function ComprobarPuTTY {
    # Verificar si PuTTY está instalado utilizando dpkg
    if dpkg -l | grep -q "putty"; then
        echo "PuTTY esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar PuTTY
        read -p "Que desea hacer? (Actualizar/Desinstalar/Cancelar): " Accion

        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        Accion=$(echo "$Accion" | tr '[:upper:]' '[:lower:]')

        # Ejecutar la acción seleccionada por el usuario
        case $Accion in
            actualizar)
                sudo apt update
                sudo apt upgrade putty -y
                echo "PuTTY se ha actualizado correctamente."
                ;;
            desinstalar)
                sudo apt remove putty -y
                echo "PuTTY se ha desinstalado correctamente."
                ;;
            cancelar)
                echo "Se ha cancelado la accion. No se realizara ninguna operacion."
                ;;
            *)
                echo "Opcion incorrecta. Por favor, compruebe su seleccion."
                ;;
        esac
    else
        echo "PuTTY no esta instalado en el sistema."

        # Instalación de PuTTY
        sudo apt update
        sudo apt install putty -y
        echo "PuTTY se ha instalado correctamente."
    fi
}

# Llamar a la función para verificar si PuTTY está instalado
ComprobarPuTTY
