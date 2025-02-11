# Establecer la codificación de salida UTF-8 para admitir caracteres especiales
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Función para verificar si MySQL está instalado en el sistema
function Comprobar_mysql {
    $rutaMysql = "C:\Program Files\MySQL"
    
    if (Test-Path $rutaMysql) {
        Write-Host "MySQL esta instalado en el sistema."
        # Pedir al usuario que elija entre actualizar o desinstalar MySQL
        $Accion = Read-Host "Que desea hacer? (Actualizar/Desinstalar/Cancelar)"
        #Acontinuacion, vamos a indicarle que no diferencie entre las mayusculas y minisculas.
        $Accion = $Accion.ToLower()
        # Ejecutar la acción seleccionada por el usuario
        switch ($Accion) {
            "actualizar" {
                choco upgrade mysql -y
                Write-Host "MySQL se ha actualizado correctamente."
                break
            }
            "desinstalar" {
                Write-Host "Para desinstalar MySQL hay que hacerlo de forma manual yendo a Panel de control/Programas desinstalados"
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
        #Aqui sucede como en el caso de docker, mysql no se puede instalar con chocoolatey debido a que este necesita unos paquetes externos que se actualizan constantemente, por lo que se realizada desde la web.
        Write-Host "MySQL no esta instalado en el sistema."

        # Preguntar al usuario si desea instalar MySQL
        $Instalar = Read-Host "Desea instalar MySQL? (Si/No)"

        if ($Instalar.ToLower() -eq "si") {
            # Descargar la URL de descarga de MySQL desde el sitio web oficial de MySQL
            $urlDescarga = "https://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-web-community-8.0.28.0.msi"

            # Obtener la ruta de destino para el instalador descargado
            $rutaInstalador = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\mysql-installer-web-community-8.0.28.0.msi"

            # Descargar MySQL desde la URL
            Invoke-WebRequest -Uri $urlDescarga -OutFile $rutaInstalador

            # Instalar MySQL desde el instalador descargado
            Start-Process -FilePath $rutaInstalador -Wait -ArgumentList "/quiet", "/norestart"

            Write-Host "MySQL se ha instalado correctamente."
        } else {
            Write-Host "No se realizara ninguna operacion."
        }
    }
}

# Llamar a la función para verificar si MySQL está instalado y gestionar actualizaciones y desinstalaciones con Chocolatey
Comprobar_mysql
