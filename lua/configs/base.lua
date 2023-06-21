-- -------------------------------------------
-- Variables
-- -------------------------------------------
-- -------------------------------------------
-- Base
-- -------------------------------------------
vim.g.translate_source = 'ru'
vim.g.translate_target = 'en'

vim.opt.splitright = true -- vertical split вправо
vim.opt.splitbelow = true -- horizontal split вниз
vim.opt.title = true
vim.opt.termguicolors = true

--[[ vim.opt_global.errorbells = false -- Убрать звук ошибки
vim.opt_global.modeline = false -- Убрать блымы экрана
 ]]
vim.opt.list       = false -- спец символы

vim.opt.showcmd    = true
vim.opt.lazyredraw = true
vim.opt.copyindent = false

vim.cmd([[
    filetype indent plugin on
    syntax enable
]])

-- -------------------------------------------
-- Tabs and Spaces
-- -----------------------------------------------------------

vim.opt.tabstop = 4        -- 1 tab == 4 spaces
vim.opt.shiftwidth = 4     -- shift 4 spaces when tab
vim.opt.smarttab = true
vim.opt.smartindent = true -- autoindent new lines
vim.opt.autoindent = true  -- autoindent new lines
vim.opt.breakindent = true -- autoindent new lines
vim.opt.expandtab = true   -- use spaces instead of tabs
vim.opt.scrolloff = 4

-- -------------------------------------------
-- Search
-- -------------------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.showmode = true
vim.wo.wrap = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.gdefault = true
vim.opt.virtualedit = "all" -- Allow virtual editing in all modes
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.g.mouse = "a"
vim.g.autoread = true
vim.opt.fileformats = "unix,dos,mac"
vim.opt.inccommand =
"split" -- shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you

-- -------------------------------------------
-- Tabs for Filetypes
-- -------------------------------------------

vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]                                -- don't auto commenting new lines
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]] -- remove line lenght marker for selected filetes
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]] -- 2 spaces for selected filetypes

-- -------------------------------------------
-- Backups
-- -------------------------------------------
vim.opt.backup = false   -- do not keep backup files, it's 70's style
vim.opt.swapfile = false -- do not write annoying intermediate swap
vim.opt.undofile = true  -- Возможность отката назад

-- -------------------------------------------
-- Encoding
-- -------------------------------------------
vim.opt.encoding = 'utf-8'
vim.opt.termencoding = 'uft-8'
vim.opt.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileformat = 'unix'

-- -------------------------------------------
-- Minus Triling whitespaces
-- -------------------------------------------
vim.cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]

-- -------------------------------------------
-- Shell
-- -------------------------------------------
vim.opt.shell = 'zsh'
