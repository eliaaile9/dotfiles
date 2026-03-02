#!/bin/sh
#
# Riccardo Palombo - https://riccardo.im
# Preparato per la community Patreon: patreon.com/riccardopalombo

entries="← Logout\n↑ Reboot\n↓ Shutdown"
selected=$(echo -e $entries|fuzzel --dmenu --mesg="Cosa vuoi fare?" --config ~/.dotfiles/fuzzel/.config/fuzzel/fuzzel.alt.ini| awk '{print tolower($2)}')

case $selected in
  logout)
    niri msg action quit ;;
  reboot)
    systemctl reboot ;;
  shutdown)
    systemctl poweroff -i ;;
esac
