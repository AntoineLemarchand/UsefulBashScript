#!/bin/bash

listCountries=$(nordvpn countries | sed s///g | sed s/-//g | sed s/,//g | sort)
country=$(zenity \
   --list \
   --width 500 --height 500 \
   --column "Choisissez un pays" \
   --text $listCountries)

listCities=$(nordvpn cities $country | sed s///g | sed s/-//g | sed s/,//g | sort)
city=$(zenity \
   --list \
   --width 500 --height 500 \
   --column "Choisissez une ville" \
   --text $listCities)

nordvpn connect $country $city

wait

zenity --info \
   --width 500 --height 50 \
   --text "Vous êtes connecté (normalement) à $country $city"
