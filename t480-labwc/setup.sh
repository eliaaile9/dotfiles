#!/bin/bash

echo -e "Installing Reflector...\n"
sudo pacman -S reflector
echo -e "Done!\nCreating backup of old mirrorlist...\n"
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
echo -e "Done!\nUpdating mirrorlist with the fastest ones...\n"
sudo reflector --latest 10 --age 12 --country 'Italy' --protocol https --sort rate --save /etc/pacman.d/mirrorlist
echo -e "Done!\nSyncing pacman database...\n"
sudo pacman -Syy

echo -e "Done!\nInstalling essential packages and services...\n"
sudo pacman -S base-devel bluez bluez-utils cups cups-pdf git intel-ucode mesa networkmanager openssh pipewire pipewire-pulse pipewire-alsa pipewire-jack playerctl udiskie udisks2 vulkan-intel wireplumber

echo -e "Done!\nEnabling and starting essential services...\n"
sudo systemctl enable --now sshd
sudo systemctl enable --now bluetooth
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now cups.service

echo -e "Done!\nCloning and installing yay AUR helper...\n"
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
echo -e "Done!\nTidying up yay install...\n"
rm -rf yay*

echo -e "Done!\nDownloading all necessary packages from pacman...\n"
sudo pacman -S 7zip brightnessctl btop cifs-utils cliphist curl discord evince fastfetch foot fuzzel gimp grim imagemagick jdk21-openjdk jq lua mpv neovim npm nwg-look obs-studio obsidian onefetch pacman-contrib parted pavucontrol playerctl python rustup samba scrot slurp starship steam stow stylua swaybg swaylock swaync tailscale tar telegram-desktop thunar ttf-terminus-nerd unrar unzip virtualbox virtualbox-host-modules-arch waybar wine wget wl-clipboard wlsunset zip

echo -e "Done!\nDownloading all necessary packages from yay...\n"
yay -S arc-darkest-theme-git bottles drawio-desktop-bin epson-inkjet-printer-escpr2 librewolf-bin obs-vkcapture papirus-icon-theme surfshark-client surfshark-vpn-cli-bin ttf-devicons ttf-font-awesome ttf-ioskeley-mono vimix-cursors zen-browser-bin

echo -e "Done!\nDownloading rust, rustc and cargo...\n"
rustup default stable

echo -e "Done!\nStowing dotfiles in the right directories...\n"
mkdir ~/.dotfiles
cp -r ~/dotfiles/t480-labwc/* ~/.dotfiles
cd ~/.dotfiles
rm instructions.md setup.sh
for app in $(ls -d */ | sed 's/\///'); do
    stow -v "$app"
done

echo -e "Done!\nMaking executable all the script files...\n"
sudo chmod +x ~/.dotfiles/labwc/.config/labwc/scripts/*

echo -e "Done!\nTidying up pacman...\n"
sudo pacman -R qutebrowser
sudo pacman -Rns $(pacman -Qdtq)
sudo pacman -Sc
yay -Sc
echo -e "Done\n"
