return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag"
  },
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },  
      autotag = { enable = true },
      ensure_installed = { 
        "c", 
        "lua", 
        "vim", 
        "vimdoc", 
        "query", 
        "elixir", 
        "heex", 
        "javascript", 
        "html",
        "python",
        "typescript",
        "disassembly",
        "bash",
        "asm",
        "cmake",
        "css",
        "cpp",
        "csv",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "glsl",
        "go",
        "java",
        "rust",
        "markdown",
        "nasm",
        "objdump",
        "php",
        "regex",
        "toml",
        "tsx",
      },
    })
  end
}
