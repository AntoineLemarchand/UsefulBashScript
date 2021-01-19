#!/bin/bash
OUTPUT="/tmp/input.txt"

>$OUTPUT

function playlist(){
   name=$1
   url=$2
   dir=$HOME/Musique/$name
   clear
   mkdir $dir
   cd $dir && youtube-dl -i --yes-playlist -i --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 -o "%(playlist_index)s.%(title)s.%(ext)s" "$url"
}

function vid(){
   clear
   cd $HOME/Documents/Musiques/
   youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0
}

trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

dialog --title "Télechargement de mp3 youtube" \
--backtitle "ytdl V0.1" \
--inputbox "Nom de la playlist (si playlist)" 10 60 2>$OUTPUT
nom=$(<$OUTPUT)

rm $OUTPUT

dialog --title "Télechargement de mp3 youtube" \
--backtitle "ytdl V0.1" \
--inputbox "son url" 10 60 2>$OUTPUT

lien=$(<$OUTPUT)

rm $OUTPUT

dialog --title "Télechargement de mp3 youtube" \
--backtitle "ytdl V0.1" \
--yesno "Le lien est une playlist ? (sinon vidéo simple)" 10 60
response=$?

case $response in
   0) playlist $nom $lien;;
   1) vid;;
   255) echo "[ESC] key pressed.";;
esac
