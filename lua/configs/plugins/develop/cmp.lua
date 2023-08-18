
local fn = vim.fn
local cmp = require('cmp')
local lspkind = require('lspkind')


cmp.setup({
  window = {
    completion = { -- rounded border; thin-style scrollbar
      border = 'rounded',
      scrollbar = '║',
    },
    documentation = { -- no border; native-style scrollbar
      border = 'rounded',
      scrollbar = '║',
      -- other options
    },
  },
  preselect = cmp.PreselectMode.None,
  -- lspkind (icons for cmp)
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
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
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
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
