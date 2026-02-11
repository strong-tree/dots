#!/bin/bash
UPDATES=$(checkupdates | wc -l)

if [ "$UPDATES" -gt 0 ]; then
    echo "{\"text\": \"$UPDATES\", \"tooltip\": \"$UPDATES updates available\"}"
else
    echo "{\"text\": \"0\", \"tooltip\": \"System up to date\"}"
fi
