local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = false
config.front_end = "WebGpu"

-- Iterate through available GPUs and force the NVIDIA Discrete card
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
  if gpu.device_type == 'DiscreteGpu' and gpu.backend == 'Vulkan' then
    config.webgpu_preferred_adapter = gpu
    break
  end
end

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.color_scheme = "matugen_theme"
config.window_background_opacity = 0.8
config.scrollback_lines = 2000
config.font_size = 16

return config
