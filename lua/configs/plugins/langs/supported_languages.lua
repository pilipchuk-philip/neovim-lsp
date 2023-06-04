local capabilities = vim.lsp.protocol.make_client_capabilities()
local navic = require("nvim-navic")

capabilities.textDocument.completion.completionItem.snippetSupport = true

--------------------------------------
-- Js
--------------------------------------
require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
--------------------------------------
-- Bash
--------------------------------------
require'lspconfig'.bashls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
--------------------------------------
-- Css
--------------------------------------
require'lspconfig'.cssls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
--------------------------------------
-- Docker
--------------------------------------
require'lspconfig'.dockerls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
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
require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
--------------------------------------
-- Json
--------------------------------------
require'lspconfig'.jsonls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
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
require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
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
require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
--------------------------------------
-- Sql
--------------------------------------
require'lspconfig'.sqlls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end

}
--------------------------------------
-- Pyright
--------------------------------------
require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- client.handlers["textDocument/publishDiagnostics"] = function(...) end
        navic.attach(client, bufnr)
    end
}
require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
}
--[[ local on_attach = function(client, bufnr)
  -- Disable hover in favor of Pyright
  client.server_capabilities.hoverProvider = false
end ]]

require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
}
--------------------------------------
-- Navic
--------------------------------------
 navic.setup {
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = ' ',
    Interface = ' ',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' '
  }
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
