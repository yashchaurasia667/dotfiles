local opt = vim.opt

opt.number = true
opt.cursorline = true
opt.relativenumber = true

opt.syntax = "on"

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2


opt.wrap = true

vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste --no-newline"
  },
  cache_enabled = 0,
}
