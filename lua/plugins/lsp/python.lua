vim.lsp.config("pyrefly", {
  cmd = { "pyrefly", "lsp" },
  filetypes = { "python" },
  root_markers = {
    ".git",
    "pyproject.toml",
    "poetry.lock",
    "Pipfile",
    ".venv",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
  },
  settings = {
    pyrefly = {
      diagnostics = true,
      lint = true,
    },
  },
})
vim.lsp.enable("pyrefly")


return {}
