#!/bin/bash

countries=$(nordvpn countries)
ask=()
for i in $countries; do
   $ask+=$i
   echo $ask
done

#dialog --title "nordvpnCLI V0.1" \
   #--backtitle "NORDVPN" \
   #--menu "Veuillez sélectioner un pays" 30 50 50 $countries
