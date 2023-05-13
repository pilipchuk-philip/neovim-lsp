-----------------------------------------------------------
-- Configs
-----------------------------------------------------------
require('configs.base')
----------------Keymaps------------------------------------
require('configs.keymaps.base')
require('configs.keymaps.plugins')
----------------Langs--------------------------------------
require('configs.plugins.langs.cmp')
require('configs.plugins.langs.supported_languages')
require('configs.plugins.langs.treesitter')
----------------Plugins------------------------------------
require('configs.plugins.search.telescope')
-- require('configs.plugins.git.gitsings')
require('configs.plugins.ui.ui')
-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require('plugins.plugins')


