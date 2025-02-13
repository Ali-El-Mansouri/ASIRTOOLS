# ASIRTools

ASIRTools es una colección de herramientas diseñadas para ayudar a los estudiantes y profesionales de Administración de Sistemas Informáticos en Red (ASIR). Este proyecto busca facilitar tareas comunes de administración de sistemas, redes y seguridad informática mediante scripts y utilidades automatizadas.

## Características

- Scripts para la gestión de usuarios y permisos en Linux.
- Herramientas de monitorización y diagnóstico de red.
- Utilidades para copias de seguridad y restauración.
- Automatización de tareas administrativas.
- Compatibilidad con sistemas Linux y Windows.

## Requisitos

Para utilizar ASIRTools, es necesario contar con:

- Un sistema operativo basado en Linux (Ubuntu, Debian, CentOS) o Windows.
- Python 3.x instalado (para la ejecución de algunos scripts).
- Permisos de administrador (root o sudo) en algunos casos.

## Instalación

### En Linux

```sh
# Clonar el repositorio
git clone https://github.com/tu-usuario/ASIRTools.git
cd ASIRTools

# Dar permisos de ejecución a los scripts
chmod +x *.sh

# Ejecutar el script de instalación
./install.sh
```

### En Windows

1. Descargar el repositorio manualmente o con Git:
   ```sh
   git clone https://github.com/tu-usuario/ASIRTools.git
   ```
2. Acceder a la carpeta del proyecto y ejecutar los scripts según sea necesario.

## Uso

Ejecuta los scripts según la tarea que desees realizar. Algunos ejemplos:

- **Monitorización de red:**
  ```sh
  ./net_monitor.sh
  ```
- **Gestión de usuarios:**
  ```sh
  sudo ./user_manager.sh
  ```
- **Copia de seguridad:**
  ```sh
  ./backup.sh /ruta/destino
  ```

## Contribuciones

¡Las contribuciones son bienvenidas! Para colaborar:

1. Haz un fork del repositorio.
2. Crea una rama con tu nueva funcionalidad (`git checkout -b nueva-funcionalidad`).
3. Realiza cambios y haz commit (`git commit -m 'Descripción del cambio'`).
4. Envía un pull request para revisión.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

---

Desarrollado por [Ali El Mansouri](https://github.com/Ali-El-Mansouri).

