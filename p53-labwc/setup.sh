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
sudo pacman -S alsa-utils base-devel bluez bluez-utils cups cups-pdf git intel-ucode mesa networkmanager openssh pipewire pipewire-pulse pipewire-alsa pipewire-jack playerctl udiskie udisks2 vulkan-intel wireplumber

echo -e "Done!\nDownloading rust, rustc and cargo...\n"
sudo pacman -S rustup
rustup default stable

echo -e "Done!\nEnabling and starting essential services...\n"
sudo systemctl enable --now sshd
sudo systemctl enable --now bluetooth
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now cups.service

echo -e "Done!\nCloning and installing paru AUR helper...\n"
cd ~
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
echo -e "Done!\nTidying up paru install...\n"
rm -rf paru*

echo -e "Done!\nDownloading all necessary packages from pacman...\n"
sudo pacman -S 7zip brightnessctl btop cifs-utils cliphist curl ddcutil discord docker evince evolution-data-server fastfetch feishin firefox foot fuzzel gimp gnome-calendar gnome-keyring gnome-online-accounts-gtk gnome-online-accounts grim hyprpicker imagemagick jdk21-openjdk jq less lua mpv neovim npm nwg-look obs-studio obsidian ollama-cuda ollama onefetch pacman-contrib parted pavucontrol playerctl python3 python qt5-wayland rustup samba scrot slurp starship steam stow stylua swappy swaybg swaylock swaync tailscale tar telegram-desktop tesseract tesseract-data-eng tesseract-data-ita thunar translate-shell ttf-terminus-nerd unrar unzip virtualbox virtualbox-host-modules-arch waybar wf-recorder wine wget wl-clipboard wlr-randr wlsunset xdg-desktop-portal xdg-desktop-portal-wlr zbar zip

echo -e "Done!\nDownloading all necessary packages from paru...\n"
paru -S arc-darkest-theme-git drawio-desktop-bin epson-inkjet-printer-escpr2 gifski obs-vkcapture papirus-icon-theme surfshark-client surfshark-vpn-cli-bin ttf-devicons ttf-font-awesome ttf-ioskeley-mono vimix-cursors xkblayout-state

echo -e "Done!\nInstalling noctalia-shell...\n"
paru -S noctalia-shell

echo -e "Done!\nStowing dotfiles in the right directories...\n"
mkdir ~/.dotfiles
cp -r ~/dotfiles/p53-labwc/* ~/.dotfiles
cd ~/.dotfiles
rm instructions.md setup.sh
for app in */; do
    stow -v "${app%/}";
done
rm ~/.bashrc
mv ~/dotfiles/p53-labwc/bash/.bashrc ~/.dotfiles/bash/
. .bashrc

echo -e "Done!\nMaking executable all the script files...\n"
sudo chmod +x ~/.dotfiles/labwc/.config/labwc/scripts/*

echo -e "Done!\nTidying up pacman...\n"
sudo pacman -Rns $(pacman -Qdtq)
sudo pacman -Sc
yay -Sc
sudo pacman -S go
echo -e "Done\n"
