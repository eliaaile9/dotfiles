#!/bin/bash

# Configurazione
THRESHOLD=20
CHECK_INTERVAL=1 # Secondi tra un controllo e l'altro
SYNC_TAG="battery_status"
RED="#b72e17"
LAST_STATE="Unknown"

while true; do
    # Recupera capacità e stato (cambia BAT0 se il tuo sistema usa nomi diversi)
    CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -le "$THRESHOLD" ]; then
        # Invia o aggiorna la notifica
        # -t 0 la rende persistente (non sparisce da sola)
        # -r rimpiazza la notifica con lo stesso ID senza creare nuovi popup
        TITLE="ATTENZIONE"
        MSG="<span color='$RED'>   BAT:</span> $CAPACITY%"

        notify-send -t 0 -u critical \
            -h "string:x-canonical-private-synchronous:$SYNC_TAG" \
            "$TITLE" "$MSG"
        LAST_STATE="Alert"
    else
        # Se in carica o sopra soglia, chiudi la notifica specifica se esiste
        if [ "$LAST_STATE" = "Alert" ]; then
            makoctl dismiss --all > /dev/null 2>&1
            LAST_STATE="Normal"
        fi
    fi

    sleep "$CHECK_INTERVAL"
done
