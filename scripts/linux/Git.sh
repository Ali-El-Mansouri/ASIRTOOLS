#!/bin/bash

# Función para verificar si Git está instalado en el sistema
function ComprobarGit {
    # Verificar si Git está instalado utilizando dpkg
    if dpkg -l | grep -q "git"; then
        echo "Git esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar Git
        read -p "Que desea hacer? (Actualizar/Desinstalar/Cancelar): " Accion

        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        Accion=$(echo "$Accion" | tr '[:upper:]' '[:lower:]')

        # Ejecutar la acción seleccionada por el usuario
        case $Accion in
            actualizar)
                sudo apt update
                sudo apt upgrade git -y
                echo "Git se ha actualizado correctamente."
                ;;
            desinstalar)
                sudo apt remove git -y
                echo "Git se ha desinstalado correctamente."
                ;;
            cancelar)
                echo "Se ha cancelado la accion. No se realizara ninguna operacion."
                ;;
            *)
                echo "Opcion incorrecta. Por favor, compruebe su seleccion."
                ;;
        esac
    else
        echo "Git no esta instalado en el sistema."

        # Instalación de Git
        sudo apt update
        sudo apt install git -y
        echo "Git se ha instalado correctamente."
    fi
}

# Llamar a la función para verificar si Git está instalado
ComprobarGit
