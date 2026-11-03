require("modules.globals")

----------------
--- KEYBINDS ---
----------------

-- CORE
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd('rofi -show drun -display-drun ""'))
-- hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + S", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + I", hl.dsp.layout("togglesplit")) --dwindle only


-- Quickshell binds
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("qs ipc call controlcenter toggle"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("qs ipc call launcher toggle"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("qs ipc call powermenu toggle"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("qs ipc call clipboard toggle"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("qs ipc call wallpaper toggle"))

-- SHORTCUTS
-- hl.bind(mainMod .. " + M", function()
--   hl.dispatch(hl.dsp.window.resize({ x = 1280, y = 720, relative = false, window = activewindow }))
--   hl.dispatch(hl.dsp.window.float({ action = "toggle", window = activewindow }))
-- end)


-- hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("prime-run brave-origin --ozone-platform=x11"))
-- hl.bind(mainMod .. " + V", hl.dsp.exec_cmd('cliphist list | rofi -dmenu -display-dmenu "" | cliphist decode | wl-copy'))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(fileManagerSecondary))
hl.bind(mainMod .. " + Comma", hl.dsp.exec_cmd("rofi -mode emoji -show emoji -emoji-format '{emoji} {name}'"))
-- hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("vesktop"))

-- MOUSE BINDS
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Focus movement (home row + arrows)
for key, value in pairs(directions) do
  hl.bind(mainMod .. " + " .. value, hl.dsp.focus({ direction = key }))
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = key }))
end

-- Move windows
for key, value in pairs(directions) do
  hl.bind(mainMod .. " + SHIFT + " .. value, hl.dsp.window.move({ direction = key, group_aware = true }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = key, group_aware = true }))
end

-- Workspaces
for i = 1, 10 do
  local key = i % 10
  -- Move to workspace
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
  -- Move focused window to workspace
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

hl.bind(mainMod .. " + BRACKETRIGHT", hl.dsp.focus({ workspace = "+1", follow = true }))
hl.bind(mainMod .. " + BRACKETLEFT", hl.dsp.focus({ workspace = "-1", follow = true }))

-- bind = $mainMod,       Y, layoutmsg, togglesplit   # splith equivalent
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle", window = activewindow }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Scratchpad (special workspace)
hl.bind(mainMod .. " + MINUS", hl.dsp.workspace.toggle_special("special"))
hl.bind(mainMod .. " + SHIFT + MINUS", hl.dsp.window.move({ workspace = "special:special" }))

-- Enter the resize submap
hl.bind(mainMod .. " + P", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  local opts = { repeating = true }

  hl.bind("LEFT", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), opts)
  hl.bind("DOWN", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), opts)
  hl.bind("UP", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), opts)
  hl.bind("RIGHT", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), opts)

  -- Dynamic mapping via your existing 'directions' table
  local resize_vectors = {
    l = { x = -10, y = 0 },
    left = { x = -10, y = 0 },
    d = { x = 0, y = 10 },
    down = { x = 0, y = 10 },
    u = { x = 0, y = -10 },
    up = { x = 0, y = -10 },
    r = { x = 10, y = 0 },
    right = { x = 10, y = 0 },
  }

  for dir, layout_key in pairs(directions) do
    if resize_vectors[dir] then
      -- Binds your specific layout key (handling your custom layout offsets seamlessly)
      hl.bind(
        layout_key,
        hl.dsp.window.resize({
          x = resize_vectors[dir].x,
          y = resize_vectors[dir].y,
          relative = true,
        }),
        opts
      )

      -- Binds the standard directional letter mapping fallback
      hl.bind(
        dir,
        hl.dsp.window.resize({
          x = resize_vectors[dir].x,
          y = resize_vectors[dir].y,
          relative = true,
        }),
        opts
      )
    end
  end

  hl.bind("RETURN", hl.dsp.submap("reset"))
  hl.bind("ESCAPE", hl.dsp.submap("reset"))
end)

-- Volume/Mic
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -2%"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +2%"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })

-- Media control
hl.bind(mainMod .. " + CTRL + SPACE", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mainMod .. " + CTRL + LEFT", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mainMod .. " + CTRL + RIGHT", hl.dsp.exec_cmd("playerctl next"))

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("grim"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("flameshot gui"))

-- Notification center toggle
hl.bind(mainMod .. " + SLASH", hl.dsp.exec_cmd("killall -9 waybar; waybar > /dev/null 2>&1 &"))
hl.bind(mainMod .. " + SLASH", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a -f hex"))

-- Zoom
local function zoomfunction(value)
  local zoomvalue = hl.get_config("cursor:zoom_factor")
  if (zoomvalue + value) > 3.0 then
    hl.config({ cursor = { zoom_factor = 3.0 } })
  elseif (zoomvalue + value) < 1.0 then
    hl.config({ cursor = { zoom_factor = 1.0 } })
  else
    hl.config({ cursor = { zoom_factor = zoomvalue + value } })
  end
end
hl.bind("SUPER + A", function() zoomfunction(-0.3) end, { repeating = true, description = "Screen: Zoom out" })
hl.bind("SUPER + Equal", function() zoomfunction(0.3) end,  { repeating = true, description = "Screen: Zoom in" })

-- Zoom with keypad
hl.bind("SUPER + code:82", function() zoomfunction(-0.3) end, { repeating = true })
hl.bind("SUPER + code:86", function() zoomfunction(0.3) end,  { repeating = true })

-- Special workspaces (windows get sent here by the tag rules in rules.lua)
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("music"))   -- music players
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("chat"))    -- discord / whatsapp


-- Layouts
hl.bind(mainMod .. " + CTRL + D", function() set_layout("dwindle") end)
hl.bind(mainMod .. " + CTRL + M", function() set_layout("master") end)
hl.bind(mainMod .. " + CTRL + S", function() set_layout("scrolling") end)
hl.bind(mainMod .. " + CTRL + O", function() set_layout("monocle") end)

-- Cycle forward / backward through the list above
hl.bind(mainMod .. " + SHIFT + SPACE", function()
  hl.exec_cmd("/home/yash/.config/hypr/scripts/layouts.sh")
end)

