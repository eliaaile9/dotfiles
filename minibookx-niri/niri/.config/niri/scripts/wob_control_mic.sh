#!/bin/bash
if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED"; then
  echo '100 muted' > /tmp/wobpipe
else
  echo 100 > /tmp/wobpipe
fi
