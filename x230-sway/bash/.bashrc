#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias connecteduroam='nmcli con add type wifi con-name "eduroam" ifname wlan0 ssid "eduroam" wifi-sec.key-mgmt wpa-eap 802-1x.identity "elia.cortesi@studenti.unimi.it" 802-1x.password "B4CLVAMY" 802-1x.system-ca-certs yes 802-1x.eap "peap" 802-1x.phase2-auth mschapv2'
alias jn='jupyter notebook'
alias mars='java -jar ~/uni/archi2/Mars4_5.jar'
alias dir='echo "This is not Windows, u bigol"'
alias gcc='gcc -fpermissive'
alias tlauncher='java -jar /home/elia/games/mc/TLauncher.jar'
alias createvenv='python -m venv'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(starship init bash)"
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PSQL_EDITOR="/usr/bin/nvim"
export PATH=$PATH:~/.local/bin

export WINE_VK_USE_FSR=1
export WINE_FULLSCREEN_FSR=1
export WINE_VK_USE_WAYLAND=1
