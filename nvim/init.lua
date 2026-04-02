require("config.lazy")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set autoindent")
vim.cmd("set smartindent")

vim.cmd("syntax on")
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("set wrap")
vim.cmd("set encoding=utf-8")
vim.cmd("set mouse=a")
vim.cmd("set wildmenu")
vim.cmd("set lazyredraw")
vim.cmd("set showmatch")
vim.cmd("set laststatus=2")
vim.cmd("set ruler")

vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste --no-newline",
  },
  cache_enabled = 0,
}
-- vim.opt.clipboard = "unnamedplus"
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', {desc = "Yank to clipboard"})
