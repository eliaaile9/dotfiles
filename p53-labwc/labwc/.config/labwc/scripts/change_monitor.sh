#!/bin/sh

LAPTOP_SCREEN="eDP-1"
EXTERNAL_SCREEN="DP-1"

# Menu con wofi
entries="󰍹 Monitor\n󰌘 Entrambi\n󰌽 Laptop"
selected=$(echo -e $entries| fuzzel --dmenu --config ~/.dotfiles/fuzzel/.config/fuzzel/fuzzel.alt.ini | awk '{print tolower($2)}')
case $selected in
    monitor)
        wlr-randr --output "$LAPTOP_SCREEN" --off
        wlr-randr --output "$EXTERNAL_LAPTOP" --on --pos 0,0
        ;;
    entrambi)
        wlr-randr --output "$EXTERNAL_LAPTOP" --on --pos 0,0
        wlr-randr --output "$LAPTOP_SCREEN" --on --pos 0,1080
        ;;
    laptop)
        wlr-randr --output "$EXTERNAL_LAPTOP" --off
        wlr-randr --output "$LAPTOP_SCREEN" --on --pos 0,0
        ;;
esac

~/.dotfiles/labwc/.config/labwc/scripts/check_lid.sh
