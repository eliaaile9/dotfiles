#!/bin/bash

# Crea una cartella temporanea per salvare lo screenshot
TEMP_DIR=$(mktemp -d)
SCREENSHOT_PATH="$TEMP_DIR/screenshot.png"
trap "rm -rf $TEMP_DIR" EXIT

# Fai uno screenshot e salvalo nella cartella temporanea
grim -t ppm - | magick - -scale 10% -blur 0x2 -resize 1000% $SCREENSHOT_PATH

# Imposta lo screenshot come sfondo (così da avere lo stesso effetto come screensaver)
awww img "$SCREENSHOT_PATH" --transition-step 255

# Entra in idle: metti il sistema in idle e blocca lo schermo con swaylock
swaylock -C ~/.swaylock/config -i $SCREENSHOT_PATH

awww img ~/Pictures/wallpapers/sfondo.jpg
# Il sistema rimarrà bloccato indefinitamente finché non inserisci la password
# Dopo il login o il risveglio, lo sfondo verrà ripristinato

