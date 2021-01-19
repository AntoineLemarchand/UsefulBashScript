#!/bin/bash

echo "Entrez le nom de l'application :"
read name
echo "Entrez son chemin"
read progpath
echo "et le chemin de son icone"
read progicon
echo "Entrée créée !"
touch ~/.local/share/applications/$name.desktop
echo -e "[Desktop Entry]\nName=$name\nExec=$progpath\nIcon=$progicon\nType=Application" > ~/.local/share/applications/$name.desktop

