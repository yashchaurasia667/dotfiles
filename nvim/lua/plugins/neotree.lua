return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
	window = {
	  mappings = {
	    ["l"] = "open"
	  }
	}
      })

      vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", { desc = "open neotree filesystem" })
      vim.keymap.set("n", "<leader>q", ":Neotree filesystem close<CR>", { desc = "close neotree filesystem" })
    end
  }
}
