return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- local lspconfig = require("lspconfig")
      local lspconfig = vim.lsp.config

      -- ── lua_ls ────────────────────────────────────────────────────────────
      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
          },
        },
      })

      -- ── harper_ls (prose / grammar) ───────────────────────────────────────
      vim.lsp.config("harper_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "markdown", "text", "gitcommit", "html" },
        settings = {
          ["harper-ls"] = {
            linters = {
              spell_check = true,
              spelled_numbers = false,
              an_a = true,
              sentence_capitalization = true,
              unclosed_quotes = true,
              correct_number_suffix = true,
              repeated_words = true,
              long_sentences = true,
            },
          },
        },
      })

      -- ── clangd  (C / C++) ─────────────────────────────────────────────────
      vim.lsp.config("clangd", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders=1",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      })

      -- ── bashls  (Bash / Zsh / sh) ─────────────────────────────────────────
      vim.lsp.config("bashls", {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "sh", "bash", "zsh" },
        settings = {
          bashIde = {
            globPattern = "*@(.sh|.bash|.zsh|.inc|.bash_aliases|.bash_profile|.bashrc|.zshrc)",
          },
        },
      })

      -- ── cmake ─────────────────────────────────────────────────────────────
      -- Note: Makefiles have no dedicated LSP — use efm-langserver if needed.
      vim.lsp.config("cmake", {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "cmake" },
      })

      -- ── gopls  (Go) ───────────────────────────────────────────────────────
      vim.lsp.config("gopls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = { unusedparams = true, shadow = true },
            staticcheck = true,
            gofumpt = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      })

      -- ── jdtls  (Java) ─────────────────────────────────────────────────────
      vim.lsp.config("jdtls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          java = {
            configuration = { updateBuildConfiguration = "interactive" },
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            inlayHints = { parameterNames = { enabled = "all" } },
          },
        },
      })

      -- ── ts_ls  (JavaScript / TypeScript / JSX / TSX) ─────────────────────
      vim.lsp.config("ts_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      -- ── pyright  (Python) ─────────────────────────────────────────────────
      vim.lsp.config("pyright", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "standard", -- "off"|"basic"|"standard"|"strict"
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              autoImportCompletions = true,
            },
          },
        },
      })

      -- ── glsl_analyzer  (GLSL shaders) ────────────────────────────────────
      vim.lsp.config("glsl_analyzer", {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "glsl", "vert", "frag", "geom", "tesc", "tese", "comp" },
      })

      -- keymaps --
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
