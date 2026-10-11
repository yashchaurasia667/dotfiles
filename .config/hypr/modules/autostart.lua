-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  hl.exec_cmd("uwsm app -- /usr/lib/xdg-desktop-portal")
  hl.exec_cmd("uwsm app -- /usr/lib/xdg-desktop-portal-hyprland")

  hl.exec_cmd("uwsm app -- hyprpm reload -n")
  hl.exec_cmd("uwsm app -- /usr/lib/pam_kwallet_init")
  hl.exec_cmd("uwsm app -- kwalletd6")
  hl.exec_cmd("uwsm app -- systemctl --user start hyprpolkitagent")
  hl.exec_cmd("uwsm app -- awww-daemon")

  hl.exec_cmd("uwsm app -- qs & disown")
  -- hl.exec_cmd("uwsm app -- swaync")
  -- hl.exec_cmd("uwsm app -- waybar & disown")

  -- hl.exec_cmd("uwsm app -- wal -R")
  hl.exec_cmd("uwsm app -- flameshot")

  -- hl.exec_cmd("uwsm app -- eww daemon ")
  -- hl.exec_cmd("uwsm app -- eww -c ~/.config/eww/desktop_clock open desktop_clock")

  hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")
  hl.exec_cmd("uwsm app -- cliphist wipe")

  -- hyprland.exec_once("quickshell")
end)

