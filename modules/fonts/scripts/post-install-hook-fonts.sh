#!/usr/bin/env bash

mkdir -p /usr/local/share/fonts/ttf/JetBrainsMono
cp -r -u modules/fonts/JetBrainsMono/* /usr/local/share/fonts/ttf/JetBrainsMono/
mkdir -p /usr/local/share/fonts/ttf/Noto
cp -r -u modules/fonts/Noto/* /usr/local/share/fonts/ttf/Noto/

fc-cache -fv

su - jappe -c DISPLAY=:0 .config/arch-config/modules/fonts/scripts/dconf.sh
