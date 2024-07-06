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
  end,
}
