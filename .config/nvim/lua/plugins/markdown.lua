return {
  "OXY2DEV/markview.nvim",
  ft = "markdown",
  opts = {
    latex = {
      enable = true,
      -- other configurations
    },
    preview = {
      icon_provider = "devicons",       -- "mini" or "devicons"
    },
  },
  config = function()
    local presets = require("markview.presets")

    require("markview").setup({
      markdown = {
        headings = presets.headings.glow_center,
      },
    })
  end,
}
