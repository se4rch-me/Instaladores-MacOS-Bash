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

# Actualizar Homebrew
echo -e "${YELLOW}Actualizando Homebrew...${NC}"
brew update

# Instalar Python 3
echo -e "${YELLOW}Instalando Python 3...${NC}"
brew install python

# Verificar la instalación
if command -v python3 &> /dev/null
then
    echo -e "${GREEN}Python 3 se ha instalado correctamente.${NC}"
    echo -e "${YELLOW}Versión de Python instalada:${NC}"
    python3 --version
else
    echo -e "${RED}Hubo un problema con la instalación de Python 3.${NC}"
    exit 1
fi

# Agregar Python al PATH si no está
if ! echo $PATH | grep -q '/usr/local/bin'
then
    echo -e "${YELLOW}Agregando Python al PATH...${NC}"
    echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
    source ~/.bash_profile
fi

# Instalar pip si no está instalado
if ! command -v pip3 &> /dev/null
then
    echo -e "${YELLOW}Instalando pip...${NC}"
    python3 -m ensurepip --upgrade
fi

echo -e "${GREEN}Instalación completa. Python 3 está listo para usar.${NC}"
echo -e "${YELLOW}Para comenzar a usar Python, abre una nueva ventana de Terminal y escribe 'python3'.${NC}"
