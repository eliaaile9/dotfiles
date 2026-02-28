#!/bin/bash

sudo pacman -S reflector
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
sudo reflector --latest 10 --age 12 --country 'Italy' --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

sudo pacman --needed -S base-devel git networkmanager openssh pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber intel-ucode udiskie udisks2 mesa vulkan-intel tlp bluez bluez-utils playerctl

sudo systemctl enable --now sshd
sudo systemctl enable --now bluetooth
sudo systemctl enable --now tlp
sudo systemctl enable --now NetworkManager

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay*

sudo pacman --needed -S 7zip brightnessctl btop cifs-utils cliphist cups cups-pdf curl discord dunst epson-inkjet-printer-escpr2 evince fastfetch firefox foot gimp imagemagick jdk21-openjdk jq lua mpv neovim npm nwg-look obs-studio obsidian onefetch pacman-contrib parted pavucontrol playerctl python samba scrot slurp starship steam stow stylua tailscale tar thunar tlp tmux ttf-terminus-nerd unrar unzip virtualbox virtualbox-host-modules-arch waybar wine wget wl-clipboard wlsunset zip

yay -S arc-darkest-theme-git drawio obs-vkcapture papirus-icon-theme surfshark-client tf-devicons ttf-font-awesome ttf-ibmplex-mono-nerd vimix-cursors

systemctl enable --now tailscaled.service

mkdir ~/.dotfiles
git clone git@github.com:eliaaile9/dotfiles.git
cd dotfiles/t480-labwc
for app in $(ls -d */ | sed 's/\///'); do
    if [[ "$app" == ".git" ]]; then continue; fi
    stow -vRT "$HOME" "$app"
