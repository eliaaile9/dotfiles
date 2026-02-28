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

## Run setup script

After generating the ssh key run the `setup.sh` script

## Miscellaneous

After the system has been set up open nwg-look to change the cursor's theme, the general gtk theme, the gtk font anche the icon's theme.
The followings dictate the pairing:
- General Theme: `Material-Black-Mango`
- Font: `Terminess Nerd Font 11`
- Icons: `Material Black Mango Suru`
- Cursor: `Vimix Cursors`
