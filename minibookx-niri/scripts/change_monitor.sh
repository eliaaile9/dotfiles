#!/bin/sh

# Identifica i monitor con swaymsg
LAPTOP_SCREEN=$(niri msg -j outputs | jq -r '.[] | select(.name | test("DSI-1")) | .name')
EXTERNAL_SCREEN=$(niri msg -j outputs | jq -r '.[] | select(.name | test("DP-1")) | .name')

if [ -z "$EXTERNAL_SCREEN" ]; then
    notify-send "ATTENZIONE" "Nessun monitor esterno rilevato"
    exit 1
fi

# Menu con wofi
entries="󰍹 Monitor\n󰌘 Entrambi\n󰌽 Laptop"
selected=$(echo -e $entries|fuzzel --dmenu --config ~/.config/fuzzel/fuzzel.alt.ini| awk '{print tolower($2)}')

case $selected in
    monitor)
        wlr-randr --output "$LAPTOP_SCREEN" --off --output "$EXTERNAL_SCREEN" --on --pos 0,0
        ;;
    entrambi)
        wlr-randr --output "$LAPTOP_SCREEN" --on --pos 0,1080 --output "$EXTERNAL_SCREEN" --on --pos 0,0
        ;;
    laptop)
        wlr-randr --output "$LAPTOP_SCREEN" --on --pos 0,0 --output "$EXTERNAL_SCREEN" --off
        ;;
esac

sleep 0.5
awww img ~/Pictures/wallpapers/marmonero.jpg
