## Generate ssh keys for github

Use the following command to generate a new github ssh key.
``` sh
ssh-keygen -t ed25519 "your_mail@example.com"
```
It will ask for a path in which save the key and the key's passphrase.

Then you need to start the ssh-agent in the background and add the newly generated key to it 
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
then sync the repositort with `sudo pacman -Syy`

## SAMBA Volumes

Add to `/etc/fstab` the following line:
```
//your_nas_ip/sambashare /mnt/smbshare cifs noauto,x-systemd.automount,x-systemd.requires=network-online.target,_netdev,credentials=/etc/samba/credentials,uid=1000,gid=1000 0 0
```
Replace `your_nas_ip` with the IP of the nas which have the samba volume.
The file `/etc/samba/credentials` follows this declaration:
```
username=username
password=password
```
## Run setup script

After generating the ssh key run the `setup.sh` script

## Miscellaneous

After the system has been set up open nwg-look to change the cursor's theme, the general gtk theme, the gtk font anche the icon's theme.
The followings dictate the pairing:
- General Theme: `Arc-Darkest`
- Font: `Ioskeley Mono Regular 11`
- Icons: `Papirus-Dark`
- Cursor: `Vimix Cursors`


