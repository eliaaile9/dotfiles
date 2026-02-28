#!/bin/sh

GOLD="#cba135"

# wifi
WIFI_STATE=$(nmcli -t -f WIFI g)

if [ "$WIFI_STATE" = "enabled" ]; then
    WIFI_INFO=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi | grep '^yes')
    
    if [ -n "$WIFI_INFO" ]; then
        WIFI_SSID=$(echo "$WIFI_INFO" | cut -d: -f2)
        WIFI_SIGNAL=$(echo "$WIFI_INFO" | cut -d: -f3)
        WIFI_STATUS="<span color='$GOLD'>  Wifi:</span> $WIFI_SSID\n<span color='$GOLD'>Potenza:</span> $WIFI_SIGNAL%"
    else
        WIFI_STATUS="<span color='$GOLD'>  WiFi:</span> Non connesso"
    fi
else
    WIFI_STATUS="<span color='$GOLD'>  WiFi:</span> Non attivo"
fi


# bluetooth
BT_POWER=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$BT_POWER" = "yes" ]; then
    BT_CONNECTED=$(bluetoothctl devices Connected | head -n1)

    if [ -n "$BT_CONNECTED" ]; then
        BT_NAME=$(echo "$BT_CONNECTED" | cut -d' ' -f3-)
        BT_STATUS="<span color='$GOLD'> BT:</span> $BT_NAME"
    else
        BT_STATUS="<span color='$GOLD'> BT:</span> Non connesso"
    fi
else
    BT_STATUS="<span color='$GOLD'> BT:</span> Non attivo"
fi

notify-send -c "stat-glance" "CONNECTIONS" "$WIFI_STATUS\n$BT_STATUS"
