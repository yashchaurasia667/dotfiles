require("colors")
require("modules.env")
require("modules.binds")
require("modules.windowrules")
require("modules.animations")
require("modules.layouts")
require("modules.autostart")
require("modules.gestures")
require("modules.plugins")
require("modules.globals")

require("plugins.scrolloverview")

------------------
---- MONITORS ----
------------------

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "1.0",
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 5,
    border_size = 1,

    col = {
      active_border = { colors = { inverse_primary }, angle = 45 },
      inactive_border = on_secondary,
    },

    resize_on_border = true,
    allow_tearing = true,
    snap = {
      enabled = true,
      window_gap = 4,
      monitor_gap = 5,
      respect_gaps = true
    },

    layout = "scrolling",
  },

  decoration = {
    rounding = 18,
    rounding_power = 2,

    -- Change transparency of focused and unfocused windows
    active_opacity = 1.0,
    inactive_opacity = 1.0,

    blur = {
      enabled = true,
      xray = false,
      special = false,
      new_optimizations = true,
      size = 4,
      passes = 3,
      brightness = 1,
      noise = 0.1,
      contrast = 1.5,
      vibrancy = 0.3,
      vibrancy_darkness = 0.3,
      popups = false,
      popups_ignorealpha = 0.6,
      input_methods = true,
      input_methods_ignorealpha = 0.8,
    },

    shadow = {
      enabled = false,
      range = 20,
      offset = { 0, 2 },
      render_power = 10,
      color = "rgba(00000020)",
    },

    dim_inactive = false,
    dim_strength = 0.05,
    dim_special = 0.2,
  },

  animations = {
    enabled = true,
  },

  misc = {
    force_default_wallpaper = 1,
    disable_hyprland_logo = true,
  },
})

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    repeat_rate = 50,
    repeat_delay = 200,

    follow_mouse = 1,
    sensitivity = 0,

    touchpad = {
      natural_scroll = true,
      tap_to_click = true,
      disable_while_typing = true,
      scroll_factor = 0.2,
    },
  },
})
