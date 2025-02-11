# Establecer la codificación de salida UTF-8 para admitir caracteres especiales
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Función que verifica si Nmap está instalado en el sistema
function Comprobar-Nmap {
    # Ruta del ejecutable de Nmap
    $rutaNmap = "C:\ProgramData\chocolatey\lib\nmap\"
    
    # Verificar si el ejecutable de Nmap existe en la ruta especificada
    if (Test-Path $rutaNmap) {
        Write-Host "Nmap esta instalado en el sistema."
        
        # Pedir al usuario que elija entre actualizar o desinstalar Nmap
        $Accion = Read-Host "Que desea hacer? (Actualizar/Desinstalar/Cancelar)"
        
        # Convertir la entrada del usuario a minúsculas para hacerla insensible a mayúsculas y minúsculas
        $Accion = $Accion.ToLower()
        
        # Condicional para realizar la acción seleccionada por el usuario
        switch ($Accion) {
            "actualizar" {
                choco upgrade nmap -y
                Write-Host "Nmap se ha actualizado correctamente."
                break
            }
            "desinstalar" {
                choco uninstall nmap -y
                Write-Host "Nmap se ha desinstalado correctamente."
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
        Write-Host "Nmap no esta instalado en el sistema."
        
        # Instalación de Nmap
        choco install nmap -y
        Write-Host "Nmap se ha instalado correctamente."
    }
}

# Llamar a la función para verificar si Nmap está instalado
Comprobar-Nmap
