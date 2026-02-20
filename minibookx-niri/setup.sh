#!/bin/bash

sudo pacman -S reflector
sudo reflector --latest 10 --age 12 --country 'Italy' --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

sudo pacman --needed -S base-devel git networkmanager openssh pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber intel-ucode udisksie udisks2 mesa vulkan-intel tlp bluez bluez-utils
sudo systemctl enable --now sshd
sudo systemctl enable bluetooth
sudo systemctl enable tlp
sudo systemctl enable NetworkManager

cd ~
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si
cd ..
rm -rf yay*

sudo pacman --needed -S brightnessctl btop curl fastfetch foot  grim helix htop iio-sensor-proxy imagemagick jdk21-openjdk lua micro mpv neovim nwg-look pcmanfm scrot slurp starship stow tailscale tar tmux ttf-terminus-nerd unrar unzip vim waybar wget yazi zip

yay -S haiku-icon-theme rot8-git vimix-gtk-themes vimix-icon-theme vimix-cursors

# usare nwg-look per cambiare tema gtk e font di app gtk, oltre a cursore app gtk
