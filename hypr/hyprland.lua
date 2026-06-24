require("colors")
require("conf.env")
require("conf.binds")
require("conf.windowrules")
require("conf.animations")
require("conf.autostart")
require("conf.gestures")
require("conf.plugins")
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
		-- disable_hyrpland_logo = true,
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

