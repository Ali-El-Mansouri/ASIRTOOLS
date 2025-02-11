# Establecer la codificación de salida UTF-8 para admitir caracteres especiales
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Función para verificar si una aplicación está instalada en Windows
function Comprobar_Chrome {
    #En widnows no existe una ruta en la que se instalen todas las aplicaciones, por lo que cada app tiene su propia ruta predeterminada.
    # Ruta del ejecutable de Google Chrome
    $rutaChrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"

   # Verificar si el ejecutable de Chrome existe en la ruta especificada
    if (Test-Path $rutaChrome) {
        Write-Host "Chrome esta instalado en el sistema."
        # Pedir al usuario que elija entre actualizar o desinstalar Chrome
        $Accion = Read-Host "Que desea hacer? (Actualizar/Desinstalar/Cancelar)"
        #Acontinuacion, vamos a indicarle que no diferencie entre las mayusculas y minisculas.
        $Accion = $Accion.ToLower()
        #Ahora creamos un condicional, segun lo que eliga el usuario se hara una cosa o otra.
        switch ($Accion) {
            "actualizar" {
                choco upgrade googlechrome -y
                Write-Host "Chrome se ha actualizado correctamente."
                break
            }
            "desinstalar" {
                choco uninstall googlechrome -y
                Write-Host "Chrome se ha desinstalado correctamente."
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
    }
    else {
        Write-Host " Google Chrome no esta instalado en el sistema."

        # Instalacion de Chrome con chocolatey
        choco install googlechrome -y
        Write-Host " Google Chrome se ha instalado correctamente."
    }
}
#Ejecutamos la funcion
Comprobar_Chrome

   
   
   
   
   
   
   


