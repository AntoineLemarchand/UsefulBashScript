#!/bin/bash
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
   url=$1
   cd $HOME/Documents/Musiques/
   youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0 "$url"
}

if zenity --question --width 250 --text "Is it a playlist or a single song ?" --ok-label "Playlist" --cancel-label "Single song"; then
   name=$(
   zenity --entry \
      --width 250 \
      --text "enter playlist name"
   )
   link=$(
   zenity --entry \
      --width 250 \
      --text "enter playlist link"
   )
   playlist $name $link
   wait
   zenity --info \
      --width 250 \
      --text "Playlist downloaded !"
else
   name=$(
   zenity --entry \
      --width 250 \
      --text "enter video name"
   )
   link=$(
   zenity --entry \
      --width 250 \
      --text "enter video url"
   )
   vid $link
   wait
   zenity --info \
      --width 250 \
      --text "Video downloaded"
fi

