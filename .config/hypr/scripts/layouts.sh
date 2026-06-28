#!/usr/bin/env bash

# layout_str=$(hyprctl getoption general:layout -j)
workspace=$(hyprctl activeworkspace -j)
layout=$(echo $workspace| jq -r '.tiledLayout')
workspace_id=$(echo $workspace| jq -r '.id')

next_layout=""
if [[ $layout == "dwindle" ]]; then
  echo "switching to scrolling layout for workspace $workspace_id"
  next_layout="scrolling"
elif [[ $layout == "scrolling" ]]; then
  echo "switching to dwindle layout for workspace $workspace_id"
  next_layout="dwindle"
# elif [[ $layout == "monocle" ]]; then
#   echo "switching to dwindle layout"
#   next_layout="dwindle"
else
  echo "switching to dwindle layout"
  next_layout="dwindle"
fi

exec hyprctl eval "hl.workspace_rule({workspace=$workspace_id, layout='$next_layout'})"
# exec hyprctl keyword workspace $(echo $workspace | jq -r '.id'),layout:$next_layout
