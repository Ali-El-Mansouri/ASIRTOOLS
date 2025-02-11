#!/bin/bash

# Función para verificar si Docker está instalado en el sistema
function ComprobarDocker {
    # Verificar si Docker está instalado utilizando dpkg
    if dpkg -l | grep -q "docker-ce"; then
        echo "Docker está instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar Docker
        read -p "Que desea hacer? (Actualizar/Desinstalar/Cancelar): " Accion

        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        Accion=$(echo "$Accion" | tr '[:upper:]' '[:lower:]')

        # Ejecutar la acción seleccionada por el usuario
        case $Accion in
            actualizar)
                sudo apt update
                sudo apt upgrade docker-ce -y
                echo "Docker se ha actualizado correctamente."
                ;;
            desinstalar)
                sudo apt remove docker-ce docker-ce-cli containerd.io -y
                echo "Docker se ha desinstalado correctamente."
                ;;
            cancelar)
                echo "Se ha cancelado la accion. No se realizara ninguna operacion."
                ;;
            *)
                echo "Opcion incorrecta. Por favor, compruebe su seleccion."
                ;;
        esac
    else
        echo "Docker no esta instalado en el sistema."

        # Instalación de Docker
        sudo apt update
        sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        sudo apt update
        sudo apt install docker-ce docker-ce-cli containerd.io -y
        echo "Docker se ha instalado correctamente."
    fi
}

# Llamar a la función para verificar si Docker está instalado
ComprobarDocker
