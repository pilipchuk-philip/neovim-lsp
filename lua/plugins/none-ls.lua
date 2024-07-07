return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require("null-ls")
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting
    local hover = null_ls.builtins.hover
    local completion = null_ls.builtins.completion

    require("null-ls").setup({
      sources = {
        -- code_actions.refactoring,
        code_actions.gitsigns,
        diagnostics.mypy.with({
          filetypes = {
            "python"
          },
        }),
        formatting.prettier.with({
          filetypes = {
            "html", "json", "yaml", "markdown"
          }
        }),
        --[[ formatting.isort.with({
          filetypes = {
            "python"
          },
          extra_args = {
            "--force-single-line-imports",
          },
        }), ]]
        formatting.black.with({
          filetypes = {
            "python"
          },
        }),
      }
    })

    -- Format code
    for _, file_pattern in ipairs({ "*.rs", "*.hs", "*.py", "*.lua", "*.md", "*.nix", "*.tf", "*.js" }) do
      vim.api.nvim_create_autocmd(
        'BufWritePre',
        {
          pattern = file_pattern,
          callback = function() vim.lsp.buf.format(nil) end
        }
      )
    end
  end,
}
