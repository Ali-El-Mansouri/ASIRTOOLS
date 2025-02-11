# Establecer la codificación de salida UTF-8 para admitir caracteres especiales
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Función que verifica si Wireshark está instalado en el sistema
function Comprobar_wireshark {
    #En widnows no existe una ruta en la que se instalen todas las aplicaciones, por lo que cada app tiene su propia ruta predeterminada.
    # Ruta del ejecutable de Wireshark
    $rutaGit = "C:\Program Files\Wireshark\Wireshark.exe"

    # Verificar si el ejecutable de Wireshark existe en la ruta especificada
    if (Test-Path $rutaGit) {
        Write-Host "Wireshark esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar Wireshark
        $Accion = Read-Host "Que desea hacer? (Actualizar/Desinstalar/Cancelar)"

        #Acontinuacion, vamos a indicarle que no diferencie entre las mayusculas y minisculas.
        $Accion = $Accion.ToLower()

        #Condicional 
        switch ($Accion) {
            "actualizar" {
                choco upgrade Wireshark -y
                Write-Host "Wireshark se ha actualizado correctamente."
                break
            }
            "desinstalar" {
                choco uninstall Wireshark -y
                Write-Host "Wireshark se ha desinstalado correctamente."
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
        Write-Host "Wireshark no esta instalado en el sistema."

        # Instalacion de Wireshark
        choco install Wireshark -y
        Write-Host "Wireshark se ha instalado correctamente."
    }
}

# Llamar a la función para verificar si Wireshark está instalado
Comprobar_wireshark
