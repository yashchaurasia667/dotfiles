#!/usr/bin/bash
# ~/.config/waybar/scripts/mediaplayer.sh
# Requires: playerctl

# Get the most active player (prioritizes playing over paused)
PLAYER=$(playerctl -l 2>/dev/null | head -n1)

if [ -z "$PLAYER" ]; then
    echo '{"text": "", "tooltip": "No media", "class": "stopped", "alt": "stopped"}'
    exit 0
fi

STATUS=$(playerctl --player="$PLAYER" status 2>/dev/null)

if [ -z "$STATUS" ] || [ "$STATUS" = "Stopped" ]; then
    echo '{"text": "", "tooltip": "No media", "class": "stopped", "alt": "stopped"}'
    exit 0
fi

ARTIST=$(playerctl --player="$PLAYER" metadata artist 2>/dev/null)
TITLE=$(playerctl --player="$PLAYER" metadata title 2>/dev/null)
ALBUM=$(playerctl --player="$PLAYER" metadata album 2>/dev/null)

# Truncate long titles for the bar
MAX_LEN=40
DISPLAY="${ARTIST:+$ARTIST - }${TITLE}"
if [ ${#DISPLAY} -gt $MAX_LEN ]; then
    DISPLAY="${DISPLAY:0:$MAX_LEN}…"
fi

# Choose icon based on status
if [ "$STATUS" = "Playing" ]; then
    ICON="󰎇 "
    CLASS="playing"
elif [ "$STATUS" = "Paused" ]; then
    ICON="󰎇 "
    CLASS="paused"
else
    ICON=""
    CLASS="stopped"
fi

# Build tooltip (multi-line)
TOOLTIP="${STATUS}"
[ -n "$TITLE" ]  && TOOLTIP="${TOOLTIP}\n ${TITLE}"
[ -n "$ARTIST" ] && TOOLTIP="${TOOLTIP}\n ${ARTIST}"
[ -n "$ALBUM" ]  && TOOLTIP="${TOOLTIP}\n ${ALBUM}"
TOOLTIP="${TOOLTIP}\n\n${PLAYER}"

# Sanitize for JSON (escape double quotes and backslashes)
DISPLAY=$(echo "$DISPLAY" | sed 's/\\/\\\\/g; s/"/\\"/g')
TOOLTIP=$(echo "$TOOLTIP" | sed 's/\\/\\\\/g; s/"/\\"/g')

echo "{\"text\": \"${ICON}${DISPLAY}\", \"tooltip\": \"${TOOLTIP}\", \"class\": \"${CLASS}\", \"alt\": \"${CLASS}\"}"
