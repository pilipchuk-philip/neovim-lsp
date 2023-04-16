local navic = require("nvim-navic")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.cmd[[set hidden]]
vim.cmd[[let g:netrw_bufsettings = 'nohidden noma nomod nonu nowrap ro buflisted']]

require"fidget".setup{}

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

require('illuminate').configure({
     providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 100,
    filetype_overrides = {},
    filetypes_denylist = {
        'dirvish',
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = nil,
    large_file_overrides = nil,
    min_count_to_highlight = 1,
})
require('lualine').setup {
    extensions = {'quickfix', 'symbols-outline'}
}

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

require("lspconfig").clangd.setup {
    on_attach = on_attach
}

----------------------------------------------------
-- Tansporecy
----------------------------------------------------
require("transparent").setup({
    groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
    },
    extra_groups = {}, -- table: additional groups that should be cleared
    exclude_groups = {}, -- table: groups you don't want to clear
})

require("wilder").setup({
    modes = {':', '/', '?'},
    next_key = '<TAB>',
})
require("wilder").set_option('renderer', require("wilder").popupmenu_renderer(
    require("wilder").popupmenu_border_theme({
        left = {' ', require("wilder").popupmenu_devicons()},
        highlighter = require("wilder").basic_highlighter(),
        min_width = '100%',
        min_height = '20%',
        max_height = '10%',
        highlights = {
            border = 'Normal', -- highlight to use for the border
        },
        border = 'rounded',
    })
))

