#!/bin/bash

# Función para verificar si Wireshark está instalado en el sistema
function ComprobarWireshark {
    # Verificar si Wireshark está instalado utilizando dpkg
    if dpkg -l | grep -q "wireshark"; then
        echo "Wireshark esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar Wireshark
        read -p "¿Qué desea hacer? (Actualizar/Desinstalar/Cancelar): " Accion

        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        Accion=$(echo "$Accion" | tr '[:upper:]' '[:lower:]')

        # Ejecutar la acción seleccionada por el usuario
        case $Accion in
            actualizar)
                sudo apt update
                sudo apt upgrade wireshark -y
                echo "Wireshark se ha actualizado correctamente."
                ;;
            desinstalar)
                sudo apt remove wireshark -y
                echo "Wireshark se ha desinstalado correctamente."
                ;;
            cancelar)
                echo "Se ha cancelado la accion. No se realizará ninguna operacion."
                ;;
            *)
                echo "Opcion incorrecta. Por favor, compruebe su seleccion."
                ;;
        esac
    else
        echo "Wireshark no está instalado en el sistema."

        # Instalación de Wireshark
        sudo apt update
        sudo apt install wireshark -y
        echo "Wireshark se ha instalado correctamente."
    fi
}

# Llamar a la función para verificar si Wireshark está instalado
ComprobarWireshark
