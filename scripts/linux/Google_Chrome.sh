#!/bin/bash

# Función para verificar si Google Chrome está instalado en el sistema
function ComprobarGoogleChrome {
    # Verificar si Google Chrome está instalado utilizando dpkg
    if dpkg -l | grep -q "google-chrome-stable"; then
        echo "Google Chrome esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar Google Chrome
        read -p "Que desea hacer? (Actualizar/Desinstalar/Cancelar): " Accion

        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        Accion=$(echo "$Accion" | tr '[:upper:]' '[:lower:]')

        # Ejecutar la acción seleccionada por el usuario
        case $Accion in
            actualizar)
                sudo apt update
                sudo apt upgrade google-chrome-stable -y
                echo "Google Chrome se ha actualizado correctamente."
                ;;
            desinstalar)
                sudo apt remove google-chrome-stable -y
                echo "Google Chrome se ha desinstalado correctamente."
                ;;
            cancelar)
                echo "Se ha cancelado la accion. No se realizara ninguna operacion."
                ;;
            *)
                echo "Opcion incorrecta. Por favor, compruebe su seleccion."
                ;;
        esac
    else
        echo "Google Chrome no esta instalado en el sistema."

        # Descargar la clave de Google Chrome e importarla
        wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

        # Agregar el repositorio de Google Chrome al archivo sources.list.d
        sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

        # Actualizar el índice de paquetes de apt
        sudo apt update

        # Instalación de Google Chrome
        sudo apt install google-chrome-stable -y
        echo "Google Chrome se ha instalado correctamente."
    fi
}

# Llamar a la función para verificar si Google Chrome está instalado
ComprobarGoogleChrome
