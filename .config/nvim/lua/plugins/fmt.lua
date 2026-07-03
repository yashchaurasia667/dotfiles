return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				rust = { "rustfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
			},
		})

		-- Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.rs", "*.jsx", "*.tsx", "*.js", "*.ts" },
			callback = function()
				require("conform").format({ lsp_fallback = true })
			end,
		})

		-- Manual format
		vim.keymap.set("n", "<leader>gf", function()
			require("conform").format({ lsp_fallback = true })
		end, { desc = "format" })
	end,
}
