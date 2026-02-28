#!/bin/bash

# Colori per il markup Pango (Stile Gold & Noir)
GOLD="#cba135"

# 1. CPU: Calcolo carico totale
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)

# 2. RAM: Usata / Totale
RAM=$(free -h | awk '/^Mem:/ {print $3 "/" $2}' | sed 's/Gi/GB/g')

# 3. DISK: Percentuale uso partizione root
DISK=$(df -h / | awk 'NR==2 {print $5}')

# 4. TEMP: Temperatura CPU (zona 0)
TEMP=$(cat /sys/class/thermal/thermal_zone0/temp | sed 's/\(..\).*/\1°C/')

# 5. BATT: Percentuale carica
BATT=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "N/A")

# 6. DATA: Formato compatto
DATE=$(date +"%d %b")

# 7. ORA: Formato compatto
TIME=$(date +"%H:%M")

# Costruzione del messaggio con markup Pango per i titoli in oro
# , , 💾, 🌡, ,  sono icone Nerd Font
MSG="<span color='$GOLD'>   CPU:</span>  $CPU%
<span color='$GOLD'>   RAM:</span>  $RAM
<span color='$GOLD'>   Disk:</span> $DISK
<span color='$GOLD'>   Temp:</span> $TEMP
<span color='$GOLD'>   Bat:</span> $BATT%
<span color='$GOLD'>   Date:</span>  $DATE
<span color='$GOLD'>   Time:</span> $TIME"

# Invia la notifica
# -a "stats" assegna una categoria che puoi usare per regole specifiche in mako
notify-send -c "stat-glance" "SYSTEM STATUS" "$MSG"
