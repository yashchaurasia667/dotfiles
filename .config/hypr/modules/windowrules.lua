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

-- Ignore maximize requests from all apps
local suppressMaximizeRule = hl.window_rule({
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

-- Floating + centered file dialogs
for _, title in ipairs({
  "^(Open File)(.*)$",
  "^(Select a File)(.*)$",
  "^(Open Folder)(.*)$",
  "^(Save As)(.*)$",
  "^(Library)(.*)$",
  "^(File Upload)(.*)$",
  "^(.*)(wants to save)$",
  "^(.*)(wants to open)$",
}) do
hl.window_rule({ match = { title = title }, float = true, center = true })
end

-- Floating utility windows (by class)
for _, class in ipairs({
  "^(blueberry\\.py)$",
  "^(guifetch)$", -- FlafyDev/guifetch
  ".*plasmawindowed.*",
  "kcm_.*",
  ".*bluedevilwizard",
}) do
hl.window_rule({ match = { class = class }, float = true })
end

hl.window_rule({ match = { title = ".*Welcome" }, float = true })
hl.window_rule({ match = { title = "^(Settings)$" }, float = true })

-- Picture-in-Picture
hl.window_rule({
  match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
  float = true,
  pin   = true,
  keep_aspect_ratio = true,
  move  = { "(monitor_w*0.73)", "(monitor_h*0.72)" },
  size  = { "(monitor_w*0.25)", "(monitor_h*0.25)" },
})

-- Screen sharing indicator
hl.window_rule({
  match = { title = ".*is sharing (a window|your screen).*" },
  float = true,
  pin   = true,
  move  = { "(monitor_w*.5-window_w*.5)", "(monitor_h-window_h-12)" },
})

-- Special workspaces (tag windows, then send each tag to its own special workspace)
local music_player_tag      = "music_player"
local communication_app_tag = "communication_app"

-- Tags every window whose `field` (class, title, initial_title, ...) matches one of `patterns`
local function tagged_rule(tag, patterns, field)
    for _, pattern in ipairs(patterns) do
        hl.window_rule({ match = { [field] = pattern }, tag = "+" .. tag })
    end
end

tagged_rule(music_player_tag, {
    "feishin|Supersonic|Plexamp",                                  -- Self hosted
    "Spotify",                                                     -- Spotify
    "Cider",                                                       -- Apple music
    "com.github.th-ch.youtube-music|com-maxrave-simpmusic-MainKt", -- YouTube music
}, "class")

tagged_rule(music_player_tag, {
    "Spotify|Spotify Free", -- Spotify wayland, it has no class for some reason
    "Blanket|com.rafaelmardojai.Blanket",
}, "initial_title")

tagged_rule(communication_app_tag, {
    "discord|equibop|vesktop", -- Discord clients
    "app.fluxer.FluxerDesktop",-- fluxer
    "whatsapp"                 -- Whatsapp
}, "class")

-- tag -> special workspace
local special_workspaces = {
    [music_player_tag]      = "special:music",
    [communication_app_tag] = "special:chat",
}
for tag, workspace in pairs(special_workspaces) do
    hl.window_rule({ match = { tag = tag }, workspace = workspace })
    hl.workspace_rule({ workspace = workspace, gaps_out = 20 })
end

-- hl.workspace_rule({ workspace = "special:chat", gaps_out = 5 })
