# ~/.config/hypr/scripts/smart_float_toggle.sh
#!/usr/bin/env bash

FLOATING=$(hyprctl activewindow -j | jq -r '.floating')
hyprctl dispatch togglefloating

if [[ "$FLOATING" == "false" ]]; then
    sleep 0.05  # small delay for Hyprland to process the state change
    hyprctl dispatch resizeactive exact 1280 720
    hyprctl dispatch centerwindow
fi
