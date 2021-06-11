#!/bin/bash
if (( $EUID != 0 )); then
   echo "Please run as root"
   exit
else
   cp -r ./ytdlcli /opt
fi
