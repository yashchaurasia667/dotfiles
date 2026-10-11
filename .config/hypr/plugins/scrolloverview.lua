hl.config({
  plugin = {
    scrolloverview = {
      gesture_distance = 300, -- how far is the "max" for the gesture
      scale = 0.65,            -- preferred overview scale
      workspace_gap = 20,
      layout = "vertical",    -- vertical, horizontal, or auto (per-monitor orientation)
      wallpaper = 2,          -- 0: global only, 1: per-workspace only, 2: both
      blur = true,            -- blur only the main overview wallpaper

      shadow = {
        enabled = false,
        range = 50,
      },
    },
  },
})

-- Toggle ScrollOverview with SUPER+g
hl.bind(mainMod .. " + TAB", function()
  if hl.plugin and hl.plugin.scrolloverview then
    hl.plugin.scrolloverview.overview("toggle")
  end
end)
