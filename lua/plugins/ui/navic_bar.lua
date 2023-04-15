local navic = require("nvim-navic")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.cmd[[set hidden]]
vim.cmd[[let g:netrw_bufsettings = 'nohidden noma nomod nonu nowrap ro buflisted']]

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

require("lspconfig").clangd.setup {
    on_attach = on_attach
}
