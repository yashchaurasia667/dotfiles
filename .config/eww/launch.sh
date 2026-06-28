#!/bin/bash
EWW="eww"

pkill -x eww
sleep 0.5

"$EWW" -c "$HOME/.config/eww/bar" open bar
"$EWW" -c "$HOME/.config/eww/bar" open music_win
sleep 0.3

"$EWW" -c "$HOME/.config/eww/desktop_clock" open desktop_clock
sleep 0.3

for win in main pfp time song song_ctl song_prog seper sys_usg sys_tray quote; do
  "$EWW" -c "$HOME/.config/eww/leftbar" open "$win"
done
