#!/bin/sh

entries="← Logout\n↑ Reboot\n↓ Shutdown"
selected=$(echo -e $entries|fuzzel --dmenu --mesg="Cosa vuoi fare?" --config ~/.dotfiles/fuzzel/.config/fuzzel/fuzzel.alt.ini | awk '{print tolower($2)}')

case $selected in
  logout)
    exec labwc -e;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
