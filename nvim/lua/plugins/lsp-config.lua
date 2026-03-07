return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = {
          -- Already present
          "lua_ls",
          "rust_analyzer",
          "harper_ls",
          "clangd",
          "bashls",
          "neocmake",
          "gopls",
          "jdtls",
          "ts_ls",
          "pyright",
          "glsl_analyzer",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()

      -- ── Shared on_attach ──────────────────────────────────────────────────
      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local ext = function(desc) return vim.tbl_extend('force', opts, { desc = desc }) end

        -- Go to …
        vim.keymap.set('n', 'ds',              vim.lsp.buf.definition,     ext('LSP: Go to definition'))
        vim.keymap.set('n', 'dD',              vim.lsp.buf.declaration,    ext('LSP: Go to declaration'))
        vim.keymap.set('n', 'dr',              vim.lsp.buf.references,     ext('LSP: List references'))
        vim.keymap.set('n', 'di',              vim.lsp.buf.implementation, ext('LSP: Go to implementation'))
        -- Hover / signature
        vim.keymap.set('n', 'K',               vim.lsp.buf.hover,          ext('LSP: Hover docs'))
        vim.keymap.set('n', '<C-k>',           vim.lsp.buf.signature_help, ext('LSP: Signature help'))
        -- Rename & actions
        vim.keymap.set('n', '<leader>rn',      vim.lsp.buf.rename,         ext('LSP: Rename symbol'))
        vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action,   ext('LSP: Code action'))
        -- Diagnostics  (n/e = next/prev on Colemak)
        vim.keymap.set('n', '<leader>dn',      vim.diagnostic.goto_next,   ext('LSP: Next diagnostic'))
        vim.keymap.set('n', '<leader>de',      vim.diagnostic.goto_prev,   ext('LSP: Prev diagnostic'))
        vim.keymap.set('n', '<leader>dl',      vim.diagnostic.open_float,  ext('LSP: Show diagnostic'))
        -- Format
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, ext('LSP: Format buffer'))
      end

      -- ── Shared capabilities ───────────────────────────────────────────────
      local capabilities = vim.lsp.protocol.make_client_capabilities()


      -- ── lua_ls ────────────────────────────────────────────────────────────
      vim.lsp.config("lua_ls", {
        cmd          = { "lua-language-server" },
        on_attach    = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime   = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = { globals = { "vim" } },
            telemetry   = { enable = false },
          },
        },
      })

     -- ── harper_ls (prose / grammar) ───────────────────────────────────────
      vim.lsp.config("harper_ls", {
        on_attach    = on_attach,
        capabilities = capabilities,
        filetypes    = { "markdown", "text", "gitcommit", "html" },
        settings = {
          ["harper-ls"] = {
            linters = {
              spell_check             = true,
              spelled_numbers         = false,
              an_a                    = true,
              sentence_capitalization = true,
              unclosed_quotes         = true,
              correct_number_suffix   = true,
              repeated_words          = true,
              long_sentences          = true,
            },
          },
        },
      })

      -- ── clangd  (C / C++) ─────────────────────────────────────────────────
      vim.lsp.config("clangd", {
        on_attach    = on_attach,
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
        on_attach    = on_attach,
        capabilities = capabilities,
        filetypes    = { "sh", "bash", "zsh" },
        settings = {
          bashIde = {
            globPattern = "*@(.sh|.bash|.zsh|.inc|.bash_aliases|.bash_profile|.bashrc|.zshrc)",
          },
        },
      })

      -- ── cmake ─────────────────────────────────────────────────────────────
      -- Note: Makefiles have no dedicated LSP — use efm-langserver if needed.
      vim.lsp.config("cmake", {
        on_attach    = on_attach,
        capabilities = capabilities,
        filetypes    = { "cmake" },
      })

      -- ── gopls  (Go) ───────────────────────────────────────────────────────
      vim.lsp.config("gopls", {
        on_attach    = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses    = { unusedparams = true, shadow = true },
            staticcheck = true,
            gofumpt     = true,
            hints = {
              assignVariableTypes    = true,
              compositeLiteralFields = true,
              constantValues         = true,
              functionTypeParameters = true,
              parameterNames         = true,
              rangeVariableTypes     = true,
            },
          },
        },
      })

      -- ── jdtls  (Java) ─────────────────────────────────────────────────────
      vim.lsp.config("jdtls", {
        on_attach    = on_attach,
        capabilities = capabilities,
        settings = {
          java = {
            configuration = { updateBuildConfiguration = "interactive" },
            eclipse       = { downloadSources = true },
            maven         = { downloadSources = true },
            inlayHints    = { parameterNames = { enabled = "all" } },
          },
        },
      })

      -- ── ts_ls  (JavaScript / TypeScript / JSX / TSX) ─────────────────────
      vim.lsp.config("ts_ls", {
        on_attach    = on_attach,
        capabilities = capabilities,
        filetypes    = {
          "javascript", "javascriptreact",
          "typescript", "typescriptreact",
        },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints                        = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints                = true,
              includeInlayVariableTypeHints                         = true,
              includeInlayPropertyDeclarationTypeHints              = true,
              includeInlayFunctionLikeReturnTypeHints               = true,
              includeInlayEnumMemberValueHints                      = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints                        = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints                = true,
              includeInlayVariableTypeHints                         = true,
              includeInlayPropertyDeclarationTypeHints              = true,
              includeInlayFunctionLikeReturnTypeHints               = true,
              includeInlayEnumMemberValueHints                      = true,
            },
          },
        },
      })

      -- ── pyright  (Python) ─────────────────────────────────────────────────
      vim.lsp.config("pyright", {
        on_attach    = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode       = "standard", -- "off"|"basic"|"standard"|"strict"
              autoSearchPaths        = true,
              useLibraryCodeForTypes = true,
              diagnosticMode         = "workspace",
              autoImportCompletions  = true,
            },
          },
        },
      })

      -- ── glsl_analyzer  (GLSL shaders) ────────────────────────────────────
      vim.lsp.config("glsl_analyzer", {
        on_attach    = on_attach,
        capabilities = capabilities,
        filetypes    = { "glsl", "vert", "frag", "geom", "tesc", "tese", "comp" },
      })

    end
  }
}
