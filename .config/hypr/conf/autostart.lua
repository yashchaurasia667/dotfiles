-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function() 
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("/usr/lib/xdg-desktop-portal")
  hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland")

  hl.exec_cmd("hyprpm enable scrolloverview")
  hl.exec_cmd("/usr/lib/pam_kwallet_init")
  hl.exec_cmd("kwalletd6")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("awww-daemon")

  hl.exec_cmd("swaync")
  hl.exec_cmd("waybar & disown")

  -- hl.exec_cmd("wal -R")
  hl.exec_cmd("flameshot")

  hl.exec_cmd("eww daemon ")
  hl.exec_cmd("eww -c ~/.config/eww/desktop_clock open desktop_clock")

  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("cliphist wipe")
end)

