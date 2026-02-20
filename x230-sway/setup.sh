#!/bin/bash

sudo pacman -S --needed base-devel git
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

sudo pacman -S apache awk bluez bluez-utils brightnessctl cifs-utils cups cups-pdf curl cpu-x discord dunst epson-inkjet-printer-escpr2 fastfetch firefox flashrom foot gammastep geekbench gimp grim htop imagemagick jdk21-openjdk jq lua micro mpv networkmanager neovim nnn npm obs-studio obsidian okular openssh pacman-contrib parted pavucontrol php php-apache php-pgsql postgresql prettier python samba scrot slurp starship steam stow stylua tailscale tar tcpdump terminus-font tlp tmux ttf-jetbrains-mono-nerd ttf-terminus-font ttf-terminus-nerd udiskie unrar unzip vim virtualbox virtualbox-host-modules-arch waybar wine wget wlsunset zip
yay -S drawio flameshot-git obs-vkcapture surfshark-client telegram-desktop-bin terminus-font-ttf ttf-devicons ttf-font-awesome

modprobe btusb
systemctl enable tailscaled.service bluetooth.service
systemctl start tailscaled.service bluetooth.service


# per font scarica tamsyn o terminus
