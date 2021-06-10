#!/bin/bash

echo "Entrez le nom de l'application :"
read name
echo "Entrez son chemin"
read progpath
echo "et le chemin de son icone"
read progicon
touch ~/.local/share/applications/$name.desktop
echo -e "[Desktop Entry]\nName=$name\nExec=$progpath\nIcon=$progicon\nType=Application" > ~/.local/share/applications/$name.desktop
echo "Entrée créée !"

