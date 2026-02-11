#!/bin/bash

RECORD_DIR="$HOME/Videos/Recordings"
PID_FILE="/tmp/wf-recorder.pid"
mkdir -p "$RECORD_DIR"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    kill "$PID" && rm "$PID_FILE"
    notify-send "Screen Recording" "Saved"
    exit 0
fi

OUTPUT="$RECORD_DIR/rec_$(date +%Y%m%d_%H%M%S).mp4"
REGION=$(slurp -b 00000066 -c ffffffff -s 00000000) || exit 0

notify-send "Screen Recording" "Recording"

# You need to edit your own settings here
wf-recorder --audio=alsa_output.usb-Logitech_PRO_X_000000000000-00.analog-stereo.monitor \
-r 30 \
-g "$REGION" \
--codec hevc_vaapi \
-p vaapi_device=/dev/dri/renderD128 \
-p preset=slower \
-f "$OUTPUT" &

echo $! > "$PID_FILE"
