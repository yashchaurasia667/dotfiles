--------------------
--- WIDNOW RULES ---
--------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

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

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})



