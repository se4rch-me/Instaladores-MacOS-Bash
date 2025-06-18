#!/bin/bash

# Colores para la salida
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Función para imprimir mensajes en verde
print_green() {
    echo -e "${GREEN}$1${NC}"
}

# Comprobar si Homebrew está instalado
if ! command -v brew &> /dev/null
then
    print_green "Homebrew no está instalado. Instalando Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print_green "Homebrew ya está instalado."
fi

# Actualizar Homebrew
print_green "Actualizando Homebrew..."
brew update

# Instalar Node.js
print_green "Instalando Node.js..."
brew install node

# Verificar la instalación
print_green "Verificando la instalación de Node.js..."
node --version
npm --version

print_green "¡Node.js ha sido instalado correctamente!"