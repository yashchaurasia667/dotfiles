vim.g.mapleader = " "

local k = vim.keymap

k.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Go back to netrw" })

k.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search highlight" })

k.set("n", "<leader>sv", "<C-w>v", { desc = "Split windows vertically" })
k.set("n", "<leader>sh", "<C-w>s", { desc = "Split windows horizontally" })
k.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
k.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

k.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open a new tab" })
k.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
k.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
k.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
k.set("n", "<leader>tf", "<cmd>tabnew<CR>", { desc = "Open current buffer in new tab" })

