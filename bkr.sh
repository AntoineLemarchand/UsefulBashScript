#!/bin/bash

vol=$(
zenity --entry \
   --width 100 \
   --text "Enter a flour volume: "
)

hydration=$(
zenity --entry \
   --width 100 \
   --text "Enter hydration percentage: "
)

multi=$(echo "scale=2; $hydration/100"|bc -l)
water=$(echo "$multi*$vol"|bc -l)
salt=$(echo "$vol*0.02"|bc -l)
levain=$(echo "$vol*0.2"|bc -l)

zenity --info \
   --width 250 --height 100 \
   --text "For $vol gr of flour : \n $water gr of water \n $salt gr of salt"

