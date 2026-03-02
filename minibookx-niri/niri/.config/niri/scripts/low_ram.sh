#!/bin/bash

# Soglia in percentuale
THRESHOLD=85
CHECK_INTERVAL=1
SYNC_TAG="ram_status"
RED="#b72e17"
LAST_STATE="Unknown"

while true; do
    # Estraiamo MemTotal e MemAvailable
    TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    AVAIL=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    USED_PCT=$((100 * (TOTAL - AVAIL) / TOTAL))

    if [ $USED_PCT -gt $THRESHOLD ]; then
        TITLE="ATTENZIONE"
        MSG="<span color='$RED'>   RAM:</span> $USED_PCT%"

        notify-send -t 0 -u critical \
            -h "string:x-canonical-private-synchronous:$SYNC_TAG" \
            "$TITLE" "$MSG"
        LAST_STATE="Alert"
    else
        if [ "$LAST_STATE" = "Alert" ]; then
            makoctl dismiss --all > /dev/null 2>&1
            LAST_STATE="Normal"
        fi
    fi

    sleep "$CHECK_INTERVAL"
done
