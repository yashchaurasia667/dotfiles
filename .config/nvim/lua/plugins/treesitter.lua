return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter")
		configs.setup({
			sync_install = false,
			auto_install = true,
			indent = { enable = true },
			highlight = { enable = true },
			ensure_insalled = {
				"bash",
				"c",
				"cmake",
				"cpp",
				"css",
				"glsl",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"typescript",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				vim.treesitter.start()
			end,
		})

		-- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- vim.wo[0][0].foldmethod = "expr"
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true
	end,
}
