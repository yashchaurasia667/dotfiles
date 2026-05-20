return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.cmake_format,
				null_ls.builtins.formatting.gofmt,

				null_ls.builtins.code_actions.refactoring,
				null_ls.builtins.code_actions.textlint,

				null_ls.builtins.diagnostics.cfn_lint,
				null_ls.builtins.diagnostics.checkmake,
				null_ls.builtins.diagnostics.checkstyle,
				null_ls.builtins.diagnostics.cppcheck,
				null_ls.builtins.diagnostics.cmake_lint,
				null_ls.builtins.diagnostics.dotenv_linter,
				null_ls.builtins.diagnostics.glslc.with({
					extra_args = { "--target-env=opengl" },
				}),
				null_ls.builtins.diagnostics.revive,
				null_ls.builtins.diagnostics.markdownlint,
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"html",
						"css",
						"scss",
						"json",
						"markdown",
					},
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "format" })
	end,
}
