import tkinter as tk
from PIL import Image, ImageTk
import subprocess
import os

# Ruta de la carpeta de logos
LOGOS_FOLDER = "logos"
# Ruta de las carpetas de scripts

WINDOWS_SCRIPTS_FOLDER = "scripts/windows"
LINUX_SCRIPTS_FOLDER = "scripts/linux"


def mostrar_aplicaciones_windows():
    # Crear la ventana donde estaran las aplicaciones de windows
    ventana_aplicaciones = tk.Toplevel(ventana_principal)
    ventana_aplicaciones.title("Aplicaciones para Windows")
    ventana_aplicaciones.geometry("600x400")
    # Crear un marco que este alineado a la ventana
    frame_contenedor = tk.Frame(ventana_aplicaciones)
    frame_contenedor.pack(fill=tk.BOTH, expand=True)
    # Crear una etiqueta y darle formato
    etiqueta_aplicaciones = tk.Label(
        frame_contenedor,
        text="Aplicaciones para Windows",
        font=("Arial", 16, "bold")
    )

    etiqueta_aplicaciones.pack(pady=10)
    # Crear una especie de rectangulo que embarca la ventana
    canvas = tk.Canvas(frame_contenedor)
    canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
    # Una barra de desplazamiento
    scrollbar = tk.Scrollbar(frame_contenedor, orient=tk.VERTICAL, command=canvas.yview)
    scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
    #Se crea una especie de lienzo donde iran las herramientas
    canvas.configure(yscrollcommand=scrollbar.set)
    canvas.bind('<Configure>', lambda e: canvas.configure(scrollregion=canvas.bbox('all')))
    # Alinear la barra con el lienzo 
    frame_interior = tk.Frame(canvas)
    canvas.create_window((0, 0), window=frame_interior, anchor='nw')
    # Darle formato a los logos
    for app, detalles in aplicaciones_windows.items():
        frame_app = tk.Frame(frame_interior, bd=2, relief=tk.RIDGE)
        frame_app.pack(pady=10, padx=20, fill=tk.X)
        logo = Image.open(os.path.join(LOGOS_FOLDER, detalles["logo"])).resize((50, 50))
        logo = ImageTk.PhotoImage(logo)
        label_logo = tk.Label(frame_app, image=logo)
        label_logo.image = logo
        label_logo.pack(side=tk.LEFT, padx=10)

        frame_texto = tk.Frame(frame_app)
        frame_texto.pack(side=tk.LEFT)
        # Formato al nombre de cada herramienta
        nombre_app = tk.Label(
            frame_texto,
            text=app,
            font=("Arial", 14, "bold")
        )
        nombre_app.pack(anchor=tk.W)
        # Formato a la descripcion de cada herramienta
        descripcion_app = tk.Label(
            frame_texto,
            text=detalles["descripcion"],
            wraplength=350
        )

        descripcion_app.pack(anchor=tk.W)
        # Darle formato al boton instalar
        boton_instalar = tk.Button(
            frame_texto,
            text="Instalar",
            command=lambda app=app: ejecutar_script(app)
        )
        boton_instalar.pack(anchor=tk.W)

def mostrar_aplicaciones_linux():
    ventana_aplicaciones = tk.Toplevel(ventana_principal)
    ventana_aplicaciones.title("Aplicaciones para Linux")
    ventana_aplicaciones.geometry("600x400")

    frame_contenedor = tk.Frame(ventana_aplicaciones)
    frame_contenedor.pack(fill=tk.BOTH, expand=True)

    etiqueta_aplicaciones = tk.Label(
        frame_contenedor,
        text="Aplicaciones para Linux",
        font=("Arial", 16, "bold")
    )
    etiqueta_aplicaciones.pack(pady=10)

    canvas = tk.Canvas(frame_contenedor)
    canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

    scrollbar = tk.Scrollbar(frame_contenedor, orient=tk.VERTICAL, command=canvas.yview)
    scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

    canvas.configure(yscrollcommand=scrollbar.set)
    canvas.bind('<Configure>', lambda e: canvas.configure(scrollregion=canvas.bbox('all')))

    frame_interior = tk.Frame(canvas)
    canvas.create_window((0, 0), window=frame_interior, anchor='nw')

    for app, detalles in aplicaciones_linux.items():
        frame_app = tk.Frame(frame_interior, bd=2, relief=tk.RIDGE)
        frame_app.pack(pady=10, padx=20, fill=tk.X)
        logo = Image.open(os.path.join(LOGOS_FOLDER, detalles["logo"])).resize((50, 50))
        logo = ImageTk.PhotoImage(logo)
        label_logo = tk.Label(frame_app, image=logo)
        label_logo.image = logo
        label_logo.pack(side=tk.LEFT, padx=10)
        frame_texto = tk.Frame(frame_app)
        frame_texto.pack(side=tk.LEFT)

        nombre_app = tk.Label(
            frame_texto,
            text=app,
            font=("Arial", 14, "bold")
        )
        nombre_app.pack(anchor=tk.W)

        descripcion_app = tk.Label(
            frame_texto,
            text=detalles["descripcion"],
            wraplength=350
        )
        descripcion_app.pack(anchor=tk.W)

        boton_instalar = tk.Button(
            frame_texto,
            text="Instalar",
            command=lambda app=app: ejecutar_script(app)
        )
        boton_instalar.pack(anchor=tk.W)


# Diferenciar entre los scripts de windows y linux
def ejecutar_script(app):
    if os.name == "nt":
        script_path = os.path.join(WINDOWS_SCRIPTS_FOLDER, aplicaciones_windows[app]["script"])
        subprocess.Popen(["powershell", "-ExecutionPolicy", "ByPass", "-File", script_path])
    else:
        script_path = os.path.join(LINUX_SCRIPTS_FOLDER, aplicaciones_linux[app]["script"])
        subprocess.Popen(["bash", script_path])



# Configurar ventana principal
ventana_principal = tk.Tk()
ventana_principal.title("ASIRTOOLS")
ventana_principal.geometry("800x600")

# Cargar imágenes de los logos de Windows y Linux
logo_windows = Image.open(os.path.join(LOGOS_FOLDER, "windows_logo.png")).resize((50, 50))
logo_linux = Image.open(os.path.join(LOGOS_FOLDER, "linux_logo.png")).resize((50, 50))

# Convertir imágenes a formato compatible con tkinter
logo_windows_tk = ImageTk.PhotoImage(logo_windows)
logo_linux_tk = ImageTk.PhotoImage(logo_linux)

# Etiqueta de bienvenida
etiqueta_bienvenida = tk.Label(
    ventana_principal, 
    text="BIENVENIDO A ASIRTOOLS", 
    font=("Arial", 20)
)
etiqueta_bienvenida.pack(pady=20)

# Botones en la página principal
frame_botones = tk.Frame(ventana_principal)
frame_botones.pack(pady=20)

boton_windows = tk.Button(
    frame_botones, 
    image=logo_windows_tk, 
    text="Windows", 
    compound=tk.LEFT, 
    font=("Arial", 14, "bold"),
    command=mostrar_aplicaciones_windows
)

boton_windows.image = logo_windows_tk
boton_windows.pack(side=tk.LEFT, padx=10)

boton_linux = tk.Button(
    frame_botones, 
    image=logo_linux_tk, 
    text="Linux", 
    compound=tk.LEFT, 
    font=("Arial", 14, "bold"),
    command=mostrar_aplicaciones_linux
)
boton_linux.image = logo_linux_tk
boton_linux.pack(side=tk.LEFT, padx=10)

# Diccionarios de aplicaciones para Windows y Linux
aplicaciones_windows = {
    "Docker": {"logo": "docker_logo.png", "descripcion": "Plataforma para desarrollar, enviar y ejecutar aplicaciones.", "script": "docker.ps1"}, 
    "Git": {"logo": "git_logo.png", "descripcion": "Sistema de control de versiones distribuido.", "script": "git.ps1"}, 
    "Google Chrome": {"logo": "chrome_logo.png", "descripcion": "Navegador web rápido, seguro y gratuito.", "script": "google_chrome.ps1"}, 
    "MySQL": {"logo": "mysql_logo.png", "descripcion": "Sistema de gestión de bases de datos relacional.", "script": "mysql.ps1"}, 
    "Nmap": {"logo": "nmap_logo.png", "descripcion": "Herramienta de código abierto para exploración de red y auditoría de seguridad.", "script": "nmap.ps1"}, 
    "openVPN": {"logo": "openvpn_logo.png", "descripcion": "Software VPN de código abierto y gratuito.", "script": "openvpn.ps1"}, 
    "PuTTY": {"logo": "putty_logo.png", "descripcion": "Cliente SSH, telnet y Rlogin.", "script": "putty.ps1"}, 
    "VirtualBox": {"logo": "virtualbox_logo.png", "descripcion": "Herramienta de virtualización de escritorio, código abierto y multiplataforma.", "script": "virtualbox.ps1"}, 
    "Visual Studio Code": {"logo": "vscode_logo.png", "descripcion": "Editor de código fuente desarrollado por Microsoft.", "script": "visual_studio_code.ps1"}, 
    "Wireshark": {"logo": "wireshark_logo.png", "descripcion": "Analizador de protocolos de red.", "script": "wireshark.ps1"}
}
aplicaciones_linux = {
    "Docker": {"logo": "docker_logo.png", "descripcion": "Plataforma para desarrollar, enviar y ejecutar aplicaciones.", "script": "docker.sh"}, 
    "Git": {"logo": "git_logo.png", "descripcion": "Sistema de control de versiones distribuido.", "script": "git.sh"}, 
    "Google Chrome": {"logo": "chrome_logo.png", "descripcion": "Navegador web rápido, seguro y gratuito.", "script": "google_chrome.sh"}, 
    "MySQL": {"logo": "mysql_logo.png", "descripcion": "Sistema de gestión de bases de datos relacional.", "script": "mysql.sh"}, 
    "Nmap": {"logo": "nmap_logo.png", "descripcion": "Herramienta de código abierto para exploración de red y auditoría de seguridad.", "script": "nmap.sh"}, 
    "openVPN": {"logo": "openvpn_logo.png", "descripcion": "Software VPN de código abierto y gratuito.", "script": "openvpn.sh"}, 
    "PuTTY": {"logo": "putty_logo.png", "descripcion": "Cliente SSH, telnet y Rlogin.", "script": "putty.sh"}, 
    "VirtualBox": {"logo": "virtualbox_logo.png", "descripcion": "Herramienta de virtualización de escritorio, código abierto y multiplataforma.", "script": "virtualbox.sh"}, 
    "Visual Studio Code": {"logo": "vscode_logo.png", "descripcion": "Editor de código fuente desarrollado por Microsoft.", "script": "visual_studio_code.sh"}, 
    "Wireshark": {"logo": "wireshark_logo.png", "descripcion": "Analizador de protocolos de red.", "script": "wireshark.sh"}
}
ventana_principal.mainloop()























