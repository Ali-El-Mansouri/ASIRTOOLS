# Establecer la codificación de salida UTF-8 para admitir caracteres especiales
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Función que verifica si PuTTY está instalado en el sistema
function Comprobar_putty {
    #En widnows no existe una ruta en la que se instalen todas las aplicaciones, por lo que cada app tiene su propia ruta predeterminada.
    # Ruta del ejecutable de PuTTY
    $rutaGit = "C:\ProgramData\chocolatey\bin\PuTTY.EXE"

    # Verificar si el ejecutable de Git existe en la ruta especificada
    if (Test-Path $rutaGit) {
        Write-Host "PuTTY esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar PuTTY
        $Accion = Read-Host "Que desea hacer? (Actualizar/Desinstalar/Cancelar)"

        #Acontinuacion, vamos a indicarle que no diferencie entre las mayusculas y minisculas.
        $Accion = $Accion.ToLower()

        #Condicional 
        switch ($Accion) {
            "actualizar" {
                choco upgrade putty -y
                Write-Host "PuTTY se ha actualizado correctamente."
                break
            }
            "desinstalar" {
                choco uninstall putty -y
                Write-Host "PuTTY se ha desinstalado correctamente."
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
        Write-Host "PuTTY no esta instalado en el sistema."

        # Instalacion de PuTTY
        choco install putty -y
        Write-Host "PuTTY se ha instalado correctamente."
    }
}

# Llamar a la función para verificar si PuTTY está instalado
Comprobar_putty
