#!/bin/bash

# Función para verificar si OpenVPN está instalado en el sistema
function ComprobarOpenVPN {
    # Verificar si OpenVPN está instalado utilizando dpkg
    if dpkg -l | grep -q "openvpn"; then
        echo "OpenVPN está instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar OpenVPN
        read -p "¿Qué desea hacer? (Actualizar/Desinstalar/Cancelar): " Accion

        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        Accion=$(echo "$Accion" | tr '[:upper:]' '[:lower:]')

        # Ejecutar la acción seleccionada por el usuario
        case $Accion in
            actualizar)
                sudo apt update
                sudo apt upgrade openvpn -y
                echo "OpenVPN se ha actualizado correctamente."
                ;;
            desinstalar)
                sudo apt remove openvpn -y
                echo "OpenVPN se ha desinstalado correctamente."
                ;;
            cancelar)
                echo "Se ha cancelado la accion. No se realizara ninguna operacion."
                ;;
            *)
                echo "Opcion incorrecta. Por favor, compruebe su seleccion."
                ;;
        esac
    else
        echo "OpenVPN no está instalado en el sistema."

        # Instalación de OpenVPN
        sudo apt update
        sudo apt install openvpn -y
        echo "OpenVPN se ha instalado correctamente."
    fi
}

# Llamar a la función para verificar si OpenVPN está instalado
ComprobarOpenVPN
