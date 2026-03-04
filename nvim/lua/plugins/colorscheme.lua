return {
-- {
--    "rebelot/kanagawa.nvim",
--    name = "kanagawa",
--    priority = 1000,
--  },
  {
    "yorumicolors/yorumi.nvim",
    name = "yorumi",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme yorumi")
    end
  }
}
