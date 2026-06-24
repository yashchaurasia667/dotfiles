return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.htmlbeautifier,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.shellharden,

        null_ls.builtins.code_actions.textlint,
        null_ls.builtins.code_actions.refactoring,

        null_ls.builtins.diagnostics.cfn_lint,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.diagnostics.glslc,
        null_ls.builtins.diagnostics.pylint.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.code = diagnostic.message_id
          end,
        }),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "format" })
  end,
}
