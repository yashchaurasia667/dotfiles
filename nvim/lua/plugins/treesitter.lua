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
        "asm",
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "dart",
        "glsl",
        "go",
        "java",
        "javascript",
        "json",
        "jsx",
        "lua",
        "markdown",
        "python",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "zsh"
      }
    })
  end
}
