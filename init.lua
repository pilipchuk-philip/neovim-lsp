-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require('plugins.plugins')
-----------------------------------------------------------
-- Configs
-----------------------------------------------------------
require('configs.base')
----------------Keymaps------------------------------------
require('configs.keymaps.base')
require('configs.keymaps.plugins')
----------------Langs Plugins------------------------------
require('configs.plugins.langs.cmp')
require('configs.plugins.langs.supported_languages')
require('configs.plugins.langs.treesitter')
require('configs.plugins.git.git')
require('configs.plugins.langs.nulls')

----------------UI Plugins----------------------------------
require('configs.plugins.search.telescope')
require('configs.plugins.ui.ui')
require('configs.plugins.ui.trouble')
