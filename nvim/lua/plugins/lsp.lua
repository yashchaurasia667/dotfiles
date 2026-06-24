return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "stevearc/conform.nvim",
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

      -- C/C++
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = { "clangd", "--background-index" },
      })
      vim.lsp.enable("clangd")

      vim.lsp.enable("glsl_analyzer")

      -- Completion
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })

      -- Formatting
      require("conform").setup({
        formatters_by_ft = {
          nix = { "alejandra" },
          rust = { "rustfmt" },
          c = { "clang-format" },
          -- cpp = { "clang-format" },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.rs", "*.jsx", "*.tsx", "*.js", "*.ts" },
        callback = function()
          require("conform").format({ lsp_fallback = true })
        end,
      })

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
