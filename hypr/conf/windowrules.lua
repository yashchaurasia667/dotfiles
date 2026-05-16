--------------------
--- WIDNOW RULES ---
--------------------

hl.window_rule({
    name  = "forza",
    match = { class = "steam_app_1293830" },
    float = true,
})

hl.window_rule({
  name = "float-dolphin-chooser",
  match = { title = "Choose Application — Dolphin" },
  size = "400 600",
  float = true,
})

hl.window_rule({
  name = "float_window",
  match = { class = "^(hyprland-share-picker|org.pulseaudio.pavucontrol)" },
  size = "800 600",
  float = true,
})
