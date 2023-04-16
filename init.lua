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
require('plugins.ui.transporency')
require('plugins.ui.wilder') -- :list of values

-----------------------------------------------------------
-- Languages LSP
-----------------------------------------------------------
require('plugins.lsp_languages.supported_languages')
-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
require('keymaps.base')
require('keymaps.plugins')

