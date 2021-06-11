#!/bin/bash

listCountries=$(nordvpn countries | sed s///g | sed s/-//g | sed s/,//g | sort)
country=$(zenity \
   --list \
   --width 500 --height 500 \
   --title "NordVPN" \
   --column "Choisissez un pays" \
   $listCountries)

listCities=$(nordvpn cities $country | sed s///g | sed s/-//g | sed s/,//g | sort)
city=$(zenity \
   --list \
   --width 500 --height 200 \
   --title "NordVPN" \
   --column "Choisissez une ville" \
   $listCities)

nordvpn connect $country $city

wait

zenity --info \
   --width 500 --height 50 \
   --text "Vous êtes connecté à $country $city"
