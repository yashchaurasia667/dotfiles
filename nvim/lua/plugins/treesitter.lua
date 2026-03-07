return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter").setup({
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
      ensure_installed = {
        "lua",
        "vim",
      }
    })
  end
}
