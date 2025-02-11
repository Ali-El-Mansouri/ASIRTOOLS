# Establecer la codificación de salida UTF-8 para admitir caracteres especiales
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Función que verifica si VisuaL Code Studio está instalado en el sistema
function Comprobar_visualcode {
    #En widnows no existe una ruta en la que se instalen todas las aplicaciones, por lo que cada app tiene su propia ruta predeterminada.
    # Ruta del ejecutable de VisuaL Code Studio
    $rutaGit = "C:\Program Files\Microsoft VS Code"

    # Verificar si el ejecutable de Visual Code Studio existe en la ruta especificada
    if (Test-Path $rutaGit) {
        Write-Host "VisuaL Code Studio esta instalado en el sistema."

        # Pedir al usuario que elija entre actualizar o desinstalar VisuaL Code Studio
        $Accion = Read-Host "Que desea hacer? (Actualizar/Desinstalar/Cancelar)"

        #Acontinuacion, vamos a indicarle que no diferencie entre las mayusculas y minisculas.
        $Accion = $Accion.ToLower()

        #Condicional 
        switch ($Accion) {
            "actualizar" {
                choco upgrade vscode -y
                Write-Host "VisuaL Code Studio se ha actualizado correctamente."
                break
            }
            "desinstalar" {
                choco uninstall vscode -y
                Write-Host "VisuaL Code Studio se ha desinstalado correctamente."
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
        Write-Host "VisuaL Code Studio no esta instalado en el sistema."

        # Instalacion de VisuaL Code Studio
        choco install vscode -y
        Write-Host "VisuaL Code Studio se ha instalado correctamente."
    }
}

# Llamar a la función para verificar si VisuaL Code Studio está instalado
Comprobar_visualcode
