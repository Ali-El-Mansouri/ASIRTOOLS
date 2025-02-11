#!/bin/bash

# Función para verificar si MySQL está instalado en el sistema
function ComprobarMySQL {
    # Verificar si MySQL esta instalado utilizando dpkg
    if dpkg -l | grep -q "mysql-server"; then
        echo "MySQL esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar MySQL
        read -p "Que desea hacer? (Actualizar/Desinstalar/Cancelar): " Accion

        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        Accion=$(echo "$Accion" | tr '[:upper:]' '[:lower:]')

        # Ejecutar la acción seleccionada por el usuario
        case $Accion in
            actualizar)
                sudo apt update
                sudo apt upgrade mysql-server -y
                echo "MySQL se ha actualizado correctamente."
                ;;
            desinstalar)
                sudo apt remove mysql-server -y
                echo "MySQL se ha desinstalado correctamente."
                ;;
            cancelar)
                echo "Se ha cancelado la accion. No se realizara ninguna operacion."
                ;;
            *)
                echo "Opcion incorrecta. Por favor, compruebe su seleccion."
                ;;
        esac
    else
        echo "MySQL no esta instalado en el sistema."

        # Instalación de MySQL
        sudo apt install mysql-server -y
        echo "MySQL se ha instalado correctamente."
    fi
}

# Llamar a la función para verificar si MySQL está instalado
ComprobarMySQL
