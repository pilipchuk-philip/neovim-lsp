return {
  'hrsh7th/nvim-cmp', -- Autocompletion
  dependencies = {
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'onsails/lspkind-nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'rafamadriz/friendly-snippets' },
    { 'lukas-reineke/cmp-under-comparator' },
  },
  config = function()
    local cmp = require('cmp') -- autocomple
    local lspkind = require('lspkind')
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip').config.setup({})
    cmp.setup({
      window = {
        completion = { -- rounded border; thin-style scrollbar
          border = 'rounded',
          scrollbar = true,
        },
        documentation = { -- no border; native-style scrollbar
          border = 'rounded',
          scrollbar = '║',
          -- other options
        },
      },

      preselect = cmp.PreselectMode.None,
      formatting = {
        fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr, cmp.ItemField.Menu },
        expandable_indicator = true,
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(entry, vim_item)
            return vim_item
          end
        })
      },

      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
        ['<C-c>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            end
            cmp.confirm()
          else
            fallback()
          end
        end, { "i", "s", "c", }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
      },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'spell' },
      },
    })
    vim.cmd [[
      autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
      autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
    ]]
  end,
}
