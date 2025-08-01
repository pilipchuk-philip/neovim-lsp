return {
  'neovim/nvim-lspconfig', -- LSP Configuration & Plugins
  dependencies = {
    { 'williamboman/mason.nvim',          config = true },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'folke/neodev.nvim' },              -- lua lang helper
    { 'ryanoasis/vim-devicons' },         -- Icons
    { 'ray-x/lsp_signature.nvim' },       -- переменные в функции
    { 'linrongbin16/lsp-progress.nvim' }, -- status lsp
    { 'kyazdani42/nvim-web-devicons' },   -- Icons
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
    local lspconfig = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }


    -- mason_lspconfig.setup_handlers {
    --   function(server_name)
    --     require('lspconfig')[server_name].setup {
    --       capabilities = capabilities,
    --       on_attach = on_attach,
    --       settings = servers[server_name],
    --       filetypes = (servers[server_name] or {}).filetypes,
    --     }
    --   end,
    -- }

    --[[ lspconfig.pyright.setup({
      on_attach = on_attach,
      settings = {
        pyright = {
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            autoImportCompletions = false,
            diagnosticMode = "openFilesOnly",
            typeCheckingMode = "off",
          },
        },
      },
    }) ]]

    lspconfig.jedi_language_server.setup({
      filetypes = { "python" },
      single_file_support = true,
    })

    -- Signature
    require "lsp_signature".setup({
      hint_prefix = "", -- Fix disable pictogram
      bind = true,
      handler_opts = {
        border = "rounded"
      }
    })

    -- overwrite pyright default settings
    require('lsp-progress').setup({})
  end,
}
