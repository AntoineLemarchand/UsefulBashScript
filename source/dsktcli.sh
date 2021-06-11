#!/bin/bash

name=$(
zenity --entry \
 --width 500 \
 --text "App name"
)

path=$(
zenity --file-selection \
   --width 500 \
   --title "Select app path"
)

icon=$(
zenity --file-selection \
   --width 500 \
   --title "Select app icon's path"
)

touch ~/.local/share/applications/$name.desktop
echo -e "[Desktop Entry]\nName=$name\nExec=$path\nIcon=$icon\nType=Application" > ~/.local/share/applications/$name.desktop

wait

zenity --info \
   --width 500 \
   --text "Entry created !"


