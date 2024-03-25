local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

local sources = {
  formatting.prettier.with({
    filetypes = {
      "html", "json", "yaml", "markdown"
    }
  }),
  -- Code actions
  formatting.isort.with({
    filetypes = {
      "python"
    },
    extra_args = {
      "--force-single-line-imports",
    },
  }),
  formatting.black.with({
    filetypes = {
      "python"
    },
  }),
}

null_ls.setup({ sources = sources })

vim.diagnostic.config({
  virtual_text = true,
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

--
