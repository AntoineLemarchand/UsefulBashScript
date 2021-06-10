#!/bin/bash
OUTPUT="/tmp/input.txt"

>$OUTPUT

trap "rm $OUTPUT; exit" SIGHUP SIGINT SIGTERM

dialog --title "bkr V0.1" \
--backtitle "bakery calculator" \
--inputbox "Volume de farine :" 8 60 2>$OUTPUT

vol=$(<$OUTPUT)

rm $OUTPUT

dialog --title "bkr V0.1" \
--backtitle "bakery calculator" \
--inputbox "hydratation :" 8 60 2>$OUTPUT

hydration=$(<$OUTPUT)

rm $OUTPUT

multi=$(echo "scale=2; $hydration/100"|bc -l)
eau=$(echo "$multi*$vol"|bc -l)
sel=$(echo "$vol*0.02"|bc -l)
levain=$(echo "$vol*0.2"|bc -l)

dialog --title "bkr V0.1" \
--backtitle "bakery calculator" \
--msgbox "Pour $vol de farine : \n Eau :$eau gr\n Sel : $sel gr\n Levain : $levain gr" 10 30
--msgbox "Sel : $sel" 10 30 \
--msgbox "Levain : $levain " 10 30

