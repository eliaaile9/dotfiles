## Install essential packages

Install the packages needed for retrieving the dotfiles and the setup script:
```sh 
sudo pacman -S git firefox
```
## Generate ssh keys for github

Use the following command to generate a new github ssh key:
``` sh
ssh-keygen -t ed25519 -C "your_mail@example.com"
```
It will ask for a path in which save the key and the key's passphrase.

Then you need to start the ssh-agent in the background and add the newly generated key to it :
``` sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
Then add the public one on github.

## Enable multilib repository

Edit the `/etc/pacman.conf` file and uncomment the following lines:
```sh
[multilib]
include = /etc/pacman.d/mirrorlist
```
Edit pacman's misc options. Search and modify the following lines:
```sh
Color
VerbosePkgLists
ParallelDownloads = 20
ILoveCandy
```
Then sync the repository:
```sh
sudo pacman -Syy
```
## Download dotfiles

Download dotfiles using `git` and the previous ssh key:
```sh
git clone git@github.com:eliaaile9/dotfiles.git
```
Make executable the `setup.sh` script and run it:
```sh
sudo chmod +x setup.sh && ./setup.sh
```
## Miscellaneous

After the system has been set up open `nwg-look` to change the cursor's theme, the general gtk theme, the gtk font and the icon's theme.

The followings dictate the pairing:
- General Theme: `Arc-Darkest`
- Font: `Ioskeley Mono Regular 11`
- Icons: `Papirus-Dark`
- Cursor: `Vimix Cursors`

## Enable Tailscale

>![danger]
Is advised to reboot the system before proceeding

Start and enable the Tailscale service:
```sh
sudo systemctl enable tailscaled.service && sudo systemctl start tailscaled.service
```
Then start the Tailscale daemon and follow the instructions in the browser:
```sh
sudo tailscale up
```

## SAMBA Volumes

Add to `/etc/fstab` the following line:
```
//your_nas_ip/source_directory /mnt/target_directory cifs noauto,x-systemd.automount,x-systemd.requires=network-online.target,_netdev,credentials=/etc/samba/.credentials,uid=1000,gid=1000 0 0
```
Replace `your_nas_ip` with the IP of the nas which have the samba volume.
Replace `source_directory` with the samba volume on your nas. It can be found under `/etc/samba/smb.conf`.
Replace `target_directory` with the name of the directory that will be mounted on the filesystem.

The file `/etc/samba/.credentials` follows this declaration:
```
username=username
password=password
```
Then, give the right permissions to `/etc/samba/.credentials`:
```sh 
sudo chown root:root /etc/samba/.credentials
sudo chmod 600 /etc/samba/.credentials
```
## Printing service

Visit `localhost:631` in the browser, go in the administration panel and add the wanted printer.

## Git commit editor

Use this command to change the default git commit editor from `vi` to `nvim`:
```sh
git config --global core.editor nvim
```
## Calendars

Use `gnome-online-accounts` and `gnome-online-accounts-gtk` to add your desired account(s), then visualize it/them in `gnome-calendar`
