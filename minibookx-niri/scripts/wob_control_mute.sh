#!/bin/bash

if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"; then
    echo 0 > /tmp/wobpipe
else
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}' > /tmp/wobpipe
fi
