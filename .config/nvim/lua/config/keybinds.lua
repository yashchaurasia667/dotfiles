vim.g.mapleader = " "
local k = vim.keymap

k.set("n", "<leader>hl", ":nohl<CR>", { desc = "remove highlights" })

k.set("n", "<leader>sv", "<C-w>v", { desc = "split vertical" })
k.set("n", "<leader>sh", "<C-w>h", { desc = "split horizontal" })
k.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal size" })
k.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close split" })

k.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "new tab" })
k.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close tab" })
k.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "next tab" })
k.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "prev tab" })

k.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- vim.keymap.set("n", "<leader>n", vim.cmd.Ex, { desc = "open the netRW file explorer" })
