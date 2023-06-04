local null_ls = require("null-ls")

-- code action sources
local code_actions = null_ls.builtins.code_actions
-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics
-- formatting sources
local formatting = null_ls.builtins.formatting
-- hover sources
local hover = null_ls.builtins.hover
-- completion sources
local completion = null_ls.builtins.completion

local sources = {
  null_ls.builtins.formatting.prettier.with({
    filetyle = {
      "html", "json", "yaml", "markdown"
    }
  }),
  null_ls.builtins.diagnostics.vale,
  -- markdown
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.formatting.markdownlint,
  -- Shellcheck
  null_ls.builtins.code_actions.shellcheck,
  -- Python
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.black,
  null_ls.builtins.diagnostics.ruff.with({ command = { "python", "-m", "ruff" } }),
  null_ls.builtins.diagnostics.yamllint,
}

null_ls.setup({ sources = sources })

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false
})

for _, file_pattern in ipairs({ "*.rs", "*.hs", "*.py", "*.lua", "*.md", "*.nix", "*.tf" }) do
  vim.api.nvim_create_autocmd(
    'BufWritePre',
    {
      pattern = file_pattern,
      callback = function() vim.lsp.buf.format(nil) end
    }
  )
end
