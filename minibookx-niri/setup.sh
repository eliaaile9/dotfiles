#!/bin/bash

sudo pacman -S reflector
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
sudo reflector --latest 10 --age 12 --country 'Italy' --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

sudo pacman --needed -S base-devel git networkmanager openssh pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber intel-ucode udisksie udisks2 mesa vulkan-intel tlp bluez bluez-utils playerctl

sudo systemctl enable --now sshd
sudo systemctl enable --now bluetooth
sudo systemctl enable --now tlp
sudo systemctl enable --now NetworkManager

cd ~
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si
cd ..
rm -rf yay*

sudo pacman --needed -S 7zip brightnessctl btop cifs-utils cliphist cups cups-pdf curl epson-inkjet-printer-escpr2 evince fastfetch foot fuzzel grim iio-sensor-proxy imagemagick jdk21-openjdk jq lua mpv neovim npm nwg-look obsidian onefetch pacman-contrib pavucontrol pcmanfm poppler python ripgrep samba scrot  slurp starship stow tailscale tar thunar tlp tmux ttf-iosevka-nerd ttf-terminus-nerd unrar unzip wget wl-clipboard yazi zip zoxide

yay -S awww-bin graphite-gtk-theme-black-git librewolf-bin rot8-git surfshark-client surfshark-vpn-cli-bin suru-plus-dark-git ttf-devicons ttf-font-awesome vimix-cursors

sudo systemctl enable --now tailscaled

mkdir ~/.dotfiles
git clone git@github.com:eliaaile/dotfiles.git
cd dotfiles/minibook-niri/
for app in $(ls -d */ | sed 's/\///'); do
    if [[ "$app" == ".git" ]]; then continue; fi
    stow -vRT "$HOME" "$app"
