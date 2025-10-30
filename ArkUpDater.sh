#!/bin/bash

echo "Welcome to ark's freindly updater"
sleep 1s

### This cheack that you are root user

if [ "$EUID" -ne 0 ]; then
    echo "Run this Script With Root Acsses."
    exit 1
fi


echo "
cheking your hosts package maneger
"
sleep 1s

if [ -f /usr/bin/pacman ]; then
  echo "your host package maneger is pacman"
  # this part updates your system with pacman auto yes promtes
  pacman -Syu --noconfirm

  if [ $? -ne 0 ];
    then echo "a fuckry acourd"
  fi

fi

if [ -f /usr/bin/apt ]; then
  echo "your host package maneger is apt"
  # this part updates your system with pacman auto yes promtes
  apt update
  if [ $? -ne 0 ];
    then echo "a fuckry acourd"
  fi 
  apt upgrade -y
  if [ $? -ne 0 ];
    then echo "a fuckry acourd"
  fi

fi


echo "checking for non natvie "
which flatpak=$flatpakdir

if [ -f /usr/bin/flatpak ]; then
    flatpak update -y || echo "fuckery in flatpak update acourd"
fi

