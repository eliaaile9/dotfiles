#!/bin/bash

# Crea una cartella temporanea per salvare lo screenshot
TEMP_DIR=$(mktemp -d)
SCREENSHOT_PATH="$TEMP_DIR/screenshot.png"

# Fai uno screenshot e salvalo nella cartella temporanea
grim $SCREENSHOT_PATH

# Applica il blur all'immagine (puoi cambiare l'intensità)
convert $SCREENSHOT_PATH -blur 0x8 $SCREENSHOT_PATH

# Imposta lo screenshot come sfondo (così da avere lo stesso effetto come screensaver)
swaymsg output * bg $SCREENSHOT_PATH fill

# Entra in idle: metti il sistema in idle e blocca lo schermo con swaylock
swaylock -C ~/.swaylock/config -i $SCREENSHOT_PATH &

# Il sistema rimarrà bloccato indefinitamente finché non inserisci la password
# Dopo il login o il risveglio, lo sfondo verrà ripristinato

