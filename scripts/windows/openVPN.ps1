# Establecer la codificación de salida UTF-8 para admitir caracteres especiales
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Función que verifica si OpenVPN está instalado en el sistema
function Comprobar_openvpn {
    #En widnows no existe una ruta en la que se instalen todas las aplicaciones, por lo que cada app tiene su propia ruta predeterminada.
    # Ruta del ejecutable de OpenVPN
    $rutaGit ="C:\Program Files\OpenVPN"

    # Verificar si el ejecutable de OpenVPN existe en la ruta especificada
    if (Test-Path $rutaGit) {
        Write-Host "OpenVPN esta instalado en el sistema."
        # Pedir al usuario que elija entre actualizar o desinstalar Git
        $Accion = Read-Host "Que desea hacer? (Actualizar/Desinstalar/Cancelar)"
        #Acontinuacion, vamos a indicarle que no diferencie entre las mayusculas y minisculas.
        $Accion = $Accion.ToLower()
        #Condicional 
        switch ($Accion) {
            "actualizar" {
                choco upgrade openvpn -y
                Write-Host "OpenVPN se ha actualizado correctamente."
                break
            }
            "desinstalar" {
                choco uninstall openvpn -y
                Write-Host "OpenVPN se ha desinstalado correctamente."
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
        Write-Host "OpenVPN no esta instalado en el sistema."

        # Instalacion de OpenVPN
        choco install openvpn -y
        Write-Host "OpenVPN se ha instalado correctamente."
    }
}

# Llamar a la función para verificar si OpenVPN está instalado
Comprobar_openvpn
