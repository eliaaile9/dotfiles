#!/bin/bash

# 1. Ottiene il nome del layout attivo (es: "Italian" o "English (US)")
# Usiamo jq per estrarre il campo corretto dal primo dispositivo tastiera trovato
CURRENT=$(swaymsg -t get_inputs | jq -r '[.[] | select(.type == "keyboard")][0].xkb_active_layout_name')

# 2. Logica di switch
if [[ "$CURRENT" == *"Italian"* ]]; then
    swaymsg input "type:keyboard" xkb_layout us
else
    swaymsg input "type:keyboard" xkb_layout it
fi
