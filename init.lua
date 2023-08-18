-- Plugins
----------------Plugins -----------------------------------
require('plugins.plugins')
----------------Configs------------------------------------
require('configs.base')
----------------Keymaps------------------------------------
require('configs.keymaps.base')
require('configs.keymaps.plugins')
----------------Develop Plugins----------------------------
require('configs.plugins.develop.cmp')
require('configs.plugins.develop.supported_languages')
require('configs.plugins.develop.treesitter')
require('configs.plugins.develop.nulls')
----------------Git Plugins--------------------------------
require('configs.plugins.git.git')
----------------Search Plugins-----------------------------
require('configs.plugins.search.telescope')
----------------UI Plugins---------------------------------
require('configs.plugins.ui.ui')
