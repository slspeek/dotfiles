#!/usr/bin/env bash

set -e

if fc-list | grep 'NerdFont' &> /dev/null; then
    echo "NerdFont is al geinstalleerd, script wordt op verzoek afgebroken"
    exit 0
fi
# Script om JetBrains Nerd Font system-wide te installeren op Debian
# Bron: https://github.com/ryanoasis/nerd-fonts

# Font versie
FONT_VERSION="v3.4.0"
FONT_NAME="JetBrainsMono"
INSTALL_DIR="/usr/local/share/fonts/NerdFonts"

echo "➡️ Start installatie van $FONT_NAME Nerd Font ($FONT_VERSION)..."

# 1. Benodigde pakketten installeren
sudo apt-get update || true
sudo apt-get install -y wget unzip fontconfig

# 2. Map maken indien nodig
if [ ! -d "$INSTALL_DIR" ]; then
    echo "➡️ Map maken: $INSTALL_DIR"
    sudo mkdir -p "$INSTALL_DIR"
fi

# 3. Downloaden en uitpakken
echo "➡️ Downloaden van $FONT_NAME..."
cd /tmp
wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download\
/${FONT_VERSION}/${FONT_NAME}.zip"

echo "➡️ Uitpakken..."
unzip -o "${FONT_NAME}.zip" -d "${FONT_NAME}_unpacked"

# 4. Verplaatsen naar de systeemmap
echo "➡️ Lettertypen verplaatsen naar $INSTALL_DIR..."
sudo mv "${FONT_NAME}_unpacked"/*.ttf "$INSTALL_DIR"

# 5. Font cache updaten
echo "➡️ Font cache vernieuwen..."
sudo fc-cache -fv

# 6. Opruimen
echo "➡️ Tijdelijke bestanden opruimen..."
rm "${FONT_NAME}.zip"
rm -rf "${FONT_NAME}_unpacked"

echo "✅ $FONT_NAME Nerd Font is succesvol system-wide geïnstalleerd!"
