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
            -- ── Navigation (Colemak h/n/e/i = QWERTY h/j/k/l) ──────────────
            ["n"] = "next_node",       -- was j (move down)
            ["e"] = "prev_node",       -- was k (move up)
            ["i"] = "open",            -- was l (open / expand node)
            ["h"] = "close_node",      -- h unchanged (close / collapse node)
            -- ── Clear the old QWERTY keys so they don't ghost ────────────────
            ["j"] = "none",
            ["k"] = "none",
            ["l"] = "none",
            -- ── 'i' was "show_file_details" — moved to a free key ────────────
            ["I"] = "show_file_details",
          },
        },
      })

      vim.keymap.set('n', '<leader>n', ":Neotree filesystem reveal left<CR>", { desc = "Reveal filesystem" })
      vim.keymap.set('n', '<leader>q', ":Neotree filesystem close<CR>", { desc = "Close filesystem" })
    end
  }
}
