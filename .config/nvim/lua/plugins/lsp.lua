return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},

		config = function()
			-- Mason
			require("mason").setup()

			-- LSP
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"neocmake",
					"glsl_analyzer",
					"ts_ls",
					-- "eslint",
					"tailwindcss",
					"emmet_language_server",
				},
			})

			-- Capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Rust
			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = true,
						check = { command = "clippy" },
					},
				},
			})
			vim.lsp.enable("rust_analyzer")

			-- Typescript
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("ts_ls")
			-- vim.lsp.enable("eslint")

			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
			})
			vim.lsp.enable("tailwindcss")

			-- Emmet
			vim.lsp.config("emmet_language_server", {
				capabilities = capabilities,
				filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
			})
			vim.lsp.enable("emmet_language_server")

			-- C/C++
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = { "clangd", "--background-index" },
			})
			vim.lsp.enable("clangd")

			vim.lsp.enable("glsl_analyzer")


			-- Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local buf = args.buf
					local map = vim.keymap.set

					map("n", "gd", vim.lsp.buf.definition, { buffer = buf }, { desc = "go to definition" })
					map("n", "gk", vim.lsp.buf.hover, { buffer = buf }, { desc = "inline hint" })
					map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf }, { desc = "rename" })
					map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf }, { desc = "code actions" })
				end,
			})
		end,
	},
}
