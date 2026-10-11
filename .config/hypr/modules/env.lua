require("modules.globals")

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_THEME", "WhiteSur-cursors")
hl.env("HYPRCURSOR_THEME", "WhiteSur-cursors")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("TERMINAL", terminal)

-- prime offload
hl.env(" __NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("NVD_BACKEND", "direct")

hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland")

-- dolphin open with fix
hl.env("XDG_MENU_PREFIX", "arch-")

local function get_icon_theme()
  local handle = io.popen("gsettings get org.gnome.desktop.interface icon-theme 2>/dev/null")
  if not handle then return "hicolor" end

  local result = handle:read("*a")
  handle:close()

  -- strip surrounding quotes and whitespace gsettings wraps its output in
  result = result:gsub("'", ""):gsub("^%s+", ""):gsub("%s+$", "")

  if result == "" then return "hicolor" end
  return result
end
hl.env("QS_ICON_THEME", get_icon_theme())
