#!/bin/bash

# Comprobar si Homebrew está instalado
if ! command -v brew &> /dev/null
then
    echo "Homebrew no está instalado. Instalando Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew ya está instalado. Actualizando..."
    brew update
fi

# Instalar PHP
echo "Instalando la última versión de PHP..."
brew install php

# Comprobar la instalación
php_version=$(php -v | grep -oE 'PHP [0-9]+\.[0-9]+\.[0-9]+' | cut -d' ' -f2)
echo "PHP $php_version ha sido instalado correctamente."

# Agregar PHP al PATH si no está
if ! grep -q "$(brew --prefix)/opt/php/bin" ~/.zshrc ~/.bash_profile; then
    echo 'export PATH="$(brew --prefix)/opt/php/bin:$PATH"' >> ~/.zshrc
    echo 'export PATH="$(brew --prefix)/opt/php/sbin:$PATH"' >> ~/.zshrc
    echo "PHP ha sido agregado al PATH. Por favor, reinicia tu terminal o ejecuta 'source ~/.zshrc'."
fi

echo "Instalación completa. Puedes verificar la instalación ejecutando 'php -v'."