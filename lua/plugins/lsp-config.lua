return {
  'neovim/nvim-lspconfig', -- LSP Configuration & Plugins
  dependencies = {
    { 'williamboman/mason.nvim',          config = true },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'folke/neodev.nvim' },      -- lua lang helper
    { 'ryanoasis/vim-devicons' }, -- Icons
    -- { 'kyazdani42/nvim-web-devicons' }, -- Icons
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
    local lspconfig = require 'lspconfig'

    -- overwrite pyright default settings
    --[[ lspconfig.pyright.setup({
      on_attach = on_attach,
      settings = {
        pyright = {
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            autoImportCompletions = true,
            diagnosticMode = "openFilesOnly",
            typeCheckingMode = "off",
          },
        },
      },
    }) ]]

    -- overwrite pyright default settings
    lspconfig.jedi_language_server.setup({})
  end,
}
