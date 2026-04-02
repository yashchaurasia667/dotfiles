return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        window = {
          mappings = {
            ["l"] = "open",
          },
        },
      })
      vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", { desc = "Reveal filesystem" })
      vim.keymap.set("n", "<leader>q", ":Neotree filesystem close<CR>", { desc = "Close filesystem" })
    end,
  },
}
