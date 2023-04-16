----------------------------------------------------------
-- Configs
-----------------------------------------------------------
require('configs.base')
require('plugins.plugins')
require('configs.ui')

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require('plugins.autocomplete.cmp')
require('plugins.search.telescope')
require('plugins.treesitter.treesitter')
require('plugins.snippets.snippets') -- TODO DELETE
-----------------------------------------------------------
require('plugins.ui.fidget') -- status load for plugins
require('plugins.ui.gitsings') -- git blame
require('plugins.ui.illuminate') -- autohighlight words
require('plugins.ui.navic_bar') -- breadcrumbs
require('plugins.ui.vista') -- TODO DELETE
require('plugins.ui.transporency')
require('plugins.ui.wilder') -- :list of values

-----------------------------------------------------------
-- Languages LSP
-----------------------------------------------------------
require('plugins.lsp.lua_lsp')
require('plugins.lsp.pyright')
require('plugins.lsp.bash')
require('plugins.lsp.sql')
require('plugins.lsp.emmet')
require('plugins.lsp.rust')
require('plugins.lsp.jsonls')
require('plugins.lsp.dockerls')
require('plugins.lsp.html')
require('plugins.lsp.css')
require('plugins.lsp.yaml')
require('plugins.lsp.tsscript')

-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
require('keymaps.base')
require('keymaps.plugins')

