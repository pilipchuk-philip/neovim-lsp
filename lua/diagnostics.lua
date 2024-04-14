local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

------- Format code -------
local sources = {
  code_actions.refactoring,
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

null_ls.setup({ sources = sources })

------- Format code -------
for _, file_pattern in ipairs({ "*.rs", "*.hs", "*.py", "*.lua", "*.md", "*.nix", "*.tf" }) do
  vim.api.nvim_create_autocmd(
    'BufWritePre',
    {
      pattern = file_pattern,
      callback = function() vim.lsp.buf.format(nil) end
    }
  )
end

------- Diagnostic Config and Icons -------

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false
})

vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "󰌵", texthl = "DiagnosticSignHint" })
