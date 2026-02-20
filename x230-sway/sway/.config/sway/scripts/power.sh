#!/bin/sh
#
# Riccardo Palombo - https://riccardo.im
# Preparato per la community Patreon: patreon.com/riccardopalombo

entries="← Logout\n↑ Reboot\n↓ Shutdown"
selected=$(echo -e $entries|wofi --dmenu -i -s ~/.dotfiles/wofi/.config/wofi/style.css| awk '{print tolower($2)}')

case $selected in
  logout)
    exec swaymsg exit;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
