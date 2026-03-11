#!/bin/bash

# Configurazione cartella e nomi
DIR="$HOME/Pictures/Screenshots"
NAME="screenshot_$(date +'%Y%m%d_%H%M%S').png"
PATH_FULL="$DIR/$NAME"
mkdir -p "$DIR"

# Menu di scelta
ENTRIES="󰆟  Seleziona Area\n󰹑  Schermo Intero"
CHOICE=$(echo -e  $ENTRIES | fuzzel --dmenu --config ~/.dotfiles/fuzzel/.config/fuzzel/fuzzel.alt.ini | awk '{print tolower($2)}')

# Piccolo delay per far sparire il menu
sleep 0.2

case $CHOICE in
    seleziona) # Area
        grim -g "$(slurp)" - | swappy -f - -o "$PATH_FULL";;
    schermo) # Schermo Intero
        grim - | swappy -f - -o "$PATH_FULL";;
esac

# Se il file esiste (lo screenshot è riuscito)
if [ -f "$PATH_FULL" ]; then
    notify-send "Screenshot" -i camera-photo "Cattura eseguita" -a "Grim"
else
    notify-send "Errore" "Cattura fallita" -a "Grim"
fi
