local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--------------------------------------
-- Js
--------------------------------------
require 'lspconfig'.tsserver.setup {
  capabilities = capabilities,
}
--------------------------------------
-- Bash
--------------------------------------
require 'lspconfig'.bashls.setup {
  capabilities = capabilities,
}
--------------------------------------
-- Css
--------------------------------------
require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
--------------------------------------
-- Docker
--------------------------------------
require 'lspconfig'.dockerls.setup {
  capabilities = capabilities,
}
--------------------------------------
-- clang
--------------------------------------
require 'lspconfig'.clangd.setup {
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
}
--------------------------------------
-- yaml
--------------------------------------
require('lspconfig').yamlls.setup {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = ("/.github/workflows/*")
            ["../path/relative/to/file.yml"] == ("/.github/workflows/*")
            ["/path/from/root/of/project"] == "/.github/workflows/*"
      },
    },
  }
}
--------------------------------------
-- Html
--------------------------------------
require 'lspconfig'.html.setup {
  capabilities = capabilities,
}
--------------------------------------
-- Json
--------------------------------------
require 'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}
--------------------------------------
-- Emmet
--------------------------------------
require('lspconfig').emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
})
--------------------------------------
-- Lua
--------------------------------------
require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
--------------------------------------
-- Rust
--------------------------------------
require 'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
}
--------------------------------------
-- Sql
--------------------------------------
require 'lspconfig'.sqlls.setup {
  capabilities = capabilities,

}
--------------------------------------
-- Python
--------------------------------------
require 'lspconfig'.pyright.setup {
  capabilities = capabilities,
}
require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
}
--------------------------------------
-- Signature
--------------------------------------
require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})
