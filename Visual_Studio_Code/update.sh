#!/bin/bash

if [ ! -d ~/.config/Code/User/ ]; then
    printf "\e[31mERROR: Visual Studio Code is not installed\e[00m\n"
    exit 1
fi

mkdir -p "`dirname "$0"`/snippets"
cp ~/.config/Code/User/snippets/* "`dirname "$0"`/snippets"
cp ~/.config/Code/User/settings.json "`dirname "$0"`"
cp ~/.config/Code/User/keybindings.json "`dirname "$0"`"

exit 0
