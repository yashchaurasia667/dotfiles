#!/usr/bin/env bash

# Prints currently playing song to stdout
# Requires: playerctl

PLAYER=$(playerctl -l 2>/dev/null | while read -r p; do
st=$(playerctl --player="$p" status 2>/dev/null)
[ "$st" = "Playing" ] && echo "$p" && break
done)

# Fall back to first available player if none is actively playing
[ -z "$PLAYER" ] && PLAYER=$(playerctl -l 2>/dev/null | head -n1)

if [ -z "$PLAYER" ]; then
  echo "No media player found"
  exit 0
fi

STATUS=$(playerctl --player="$PLAYER" status 2>/dev/null)

if [ -z "$STATUS" ] || [ "$STATUS" = "Stopped" ]; then
  echo ""
  exit 0
fi

ARTIST=$(playerctl --player="$PLAYER" metadata artist 2>/dev/null)
TITLE=$(playerctl --player="$PLAYER" metadata title 2>/dev/null)

DISPLAY="${ARTIST:+$ARTIST - }${TITLE:-Unknown}"

if [ "$STATUS" = "Playing" ]; then
  ICON="󰐊 "
elif [ "$STATUS" = "Paused" ]; then
  ICON="󰏤 "
else
  ICON="󰓛 "
fi

echo "${ICON}${DISPLAY}"
