require("colors")
require("conf.env")
require("conf.binds")
require("conf.windowrules")
require("conf.autostart")
require("conf.gestures")
require("conf.globals")

------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,

		col = {
			active_border = { colors = { inverse_primary }, angle = 45 },
			inactive_border = on_secondary,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		allow_tearing = false,
		layout = "scrolling",
	},

	decoration = {
		rounding = 5,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		-- shadow = {
		--     enabled      = true,
		--     range        = 4,
		--     render_power = 3,
		--     color        = 0xee1a1a1a,
		-- },

		blur = {
			enabled = true,
			size = 5,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	misc = {
		force_default_wallpaper = -1,
		--disable_hyrpland_logo = true,
	},
})

hl.config({
	dwindle = {
		--pseudo_tile = true,
		preserve_split = true,
	},
	scrolling = {
		fullscreen_on_one_column = true,
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

		repeat_delay = 200,
		repeat_rate = 30,

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

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

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


------------------
--- ANIMATIONS ---
------------------

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("cubic", { type = "bezier", points = {{0.33, 1}, {0.68, 1}}})
hl.curve("circ", { type = "bezier", points = {{0.85, 0}, {0.15, 1}}})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "windows", enabled = true, speed = 6.79, spring = "easy", style = "gnomed" })

hl.animation({ leaf = "workspacesIn", enabled = true, speed = 7, bezier = "default", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 8, bezier = "default", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.2, bezier = "circ", style = "slidevert" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
