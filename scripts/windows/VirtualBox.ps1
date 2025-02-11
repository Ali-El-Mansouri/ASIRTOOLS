# Establecer la codificación de salida UTF-8 para admitir caracteres especiales
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Función que verifica si VirtualBox está instalado en el sistema
function Comprobar_virtualbox {
    #En widnows no existe una ruta en la que se instalen todas las aplicaciones, por lo que cada app tiene su propia ruta predeterminada.
    # Ruta del ejecutable de Git
    $rutaGit = "C:\Program Files\Oracle\VirtualBox"

    # Verificar si el ejecutable de VirtualBox existe en la ruta especificada
    if (Test-Path $rutaGit) {
        Write-Host "VirtualBox esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar Git
        $Accion = Read-Host "Que desea hacer? (Actualizar/Desinstalar/Cancelar)"

        #Acontinuacion, vamos a indicarle que no diferencie entre las mayusculas y minisculas.
        $Accion = $Accion.ToLower()

        #Condicional 
        switch ($Accion) {
            "actualizar" {
                choco upgrade virtualbox -y
                Write-Host "VirtualBox se ha actualizado correctamente."
                break
            }
            "desinstalar" {
                choco uninstall virtualbox -y
                Write-Host "VirtualBox se ha desinstalado correctamente."
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
        Write-Host "VirtualBox no esta instalado en el sistema."

        # Instalacion de VirtualBox
        choco install virtualbox -y
        Write-Host "VirtualBox se ha instalado correctamente."
    }
}

# Llamar a la función para verificar si VirtualBox está instalado
Comprobar_virtualbox
