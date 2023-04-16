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
require('plugins.snippets.snippets')
-----------------------------------------------------------
require('plugins.git.gitsings')
-----------------------------------------------------------
require('plugins.ui.ui')
-----------------------------------------------------------
-- Languages LSP
-----------------------------------------------------------
require('plugins.lsp_languages.supported_languages')
-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
require('keymaps.base')
require('keymaps.plugins')

