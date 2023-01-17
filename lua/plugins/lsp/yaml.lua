local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
})
