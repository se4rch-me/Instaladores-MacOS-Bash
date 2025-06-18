# Instaladores MacOS Bash

Repositorio de scripts en Bash para instalar herramientas esenciales de desarrollo en macOS de forma automatizada.

## 📦 Contenido

Este repositorio contiene scripts para instalar las siguientes tecnologías:

- **Git** (`install_git.sh`)
- **PHP** (`install_php.sh`)
- **MongoDB** (`instalar_mongodb.sh`)
- **Node.js** (`install_node.sh`)
- **Python 3** (`install_python.sh`)

Todos los scripts utilizan **Homebrew** como gestor de paquetes. Si Homebrew no está instalado, el script lo instalará automáticamente.

---

## 🚀 Instalación

1. Clona este repositorio:

```
git clone https://github.com/se4rch-me/Instaladores-MacOS-Bash.git
cd Instaladores-MacOS-Bash
```
Da permisos de ejecución al script que necesites:

```
chmod +x install_python.sh
```
Ejecuta el script:

```
./install_python.sh
```
📌 Recomendación: Ejecuta el script desde una terminal con permisos administrativos (o usa sudo si es necesario).

📂 Scripts disponibles
Script	Descripción
install_git.sh	Instala Git
install_php.sh	Instala PHP
instalar_mongodb.sh	Instala MongoDB
install_node.sh	Instala Node.js y npm
install_python.sh	Instala Python 3 y configuraciones

🖥️ Ejemplo: install_python.sh


```
#!/bin/bash

# Colores para mejor legibilidad
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Iniciando la instalación de Python 3 en macOS...${NC}"

# Verificar si Homebrew está instalado
if ! command -v brew &> /dev/null
then
    echo -e "${YELLOW}Homebrew no está instalado. Instalando Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${GREEN}Homebrew ya está instalado.${NC}"
fi

brew update
brew install python

if command -v python3 &> /dev/null
then
    echo -e "${GREEN}Python 3 se ha instalado correctamente.${NC}"
    python3 --version
else
    echo -e "${RED}Hubo un problema con la instalación de Python 3.${NC}"
    exit 1
fi
```
✅ Requisitos
macOS (probado en versiones recientes)

Terminal

Conexión a Internet

⚠️ Advertencias
Los scripts pueden sobrescribir configuraciones previas.

Úsalos bajo tu propia responsabilidad y revisa el código antes de ejecutarlo.

📜 Licencia
MIT License

🤝 Contribuciones
¿Quieres mejorar los scripts o agregar nuevas instalaciones? ¡Pull requests y sugerencias son bienvenidas!

📧 Contacto
Autor: se4rch-me
