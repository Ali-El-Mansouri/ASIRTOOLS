# Establecer la codificación de salida UTF-8 para admitir caracteres especiales
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Función que verifica si Docker Desktop está instalado en el sistema
function Comprobar-Docker {
    #En widnows no existe una ruta en la que se instalen todas las aplicaciones, por lo que cada app tiene su propia ruta predeterminada.
    # Verificar si la carpeta de instalación de Docker Desktop existe
    $rutaDocker = "C:\Program Files\Docker\Docker"

    if (Test-Path $rutaDocker) {
        Write-Host "Docker Desktop esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar, desinstalar o cancelar Docker
        $Accion = Read-Host "Que desea hacer? (Actualizar/Desinstalar/Cancelar)"

        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        $Accion = $Accion.ToLower()

        # Ejecutar la acción seleccionada por el usuario
        switch ($Accion) {
            "actualizar" {
                choco upgrade docker-desktop -y
                Write-Host "Docker Desktop se ha actualizado correctamente."
                break
            }
            "desinstalar" {
                Write-Host "Para poder desinstalar Docker, hay que hacerlo de forma manual, yendo a Panel de control/deisntlar programas."
                break
            }
            "cancelar" {
                Write-Host "Se ha cancelado la accion. No se realizara ninguna operacion."
                break
            }
            default {
                Write-Host "Opcion incorrecta. Por favor, compruebe su seleccion."
            }
        }
    } else {
        #En este caso, Docker no se puede instalar desde chocoolatey debido a que este necesita algunos paquetes externos para que se lleve bien la instalacion, por lo que se realizara a partir de la web.
        Write-Host "Docker Desktop no esta instalado en el sistema."

        # Descargar e instalar Docker Desktop desde el sitio web oficial
        Write-Host "Procediendo a descargar e instalar Docker Desktop desde el sitio web oficial..."

        # URL de descarga de Docker Desktop
        $url = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"

        # Ruta de destino para guardar el instalador de Docker Desktop
        $ruta_instalador = "$env:TEMP\DockerDesktopInstaller.exe"

        # Descargar el instalador de Docker Desktop
        Invoke-WebRequest -Uri $url -OutFile $ruta_instalador

        # Instalar Docker Desktop
        Start-Process -FilePath $ruta_instalador -Wait

        Write-Host "Docker Desktop se ha instalado correctamente."
    }
}

# Llamar a la función para verificar si Docker Desktop está instalado
Comprobar-Docker
