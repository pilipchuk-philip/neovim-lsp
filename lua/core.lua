-- Set highlight on search
vim.o.hlsearch      = false

-- Make line numbers default
vim.wo.number       = true

-- Enable mouse mode
vim.o.mouse         = 'a'

-- Default TABS
vim.o.tabstop       = 4    -- A TAB character looks like 4 spaces
vim.o.expandtab     = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop   = 4    -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth    = 4    -- Number of spaces inserted when indenting

vim.o.breakindent   = true -- Enable break indent
vim.opt.splitright  = true -- vertical split вправо
vim.opt.splitbelow  = true -- horizontal split вниз
vim.opt.title       = true

-- Save undo history
vim.o.undofile      = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase    = true
vim.o.smartcase     = true

vim.wo.signcolumn   = 'yes' -- Keep signcolumn on by default ??
vim.opt.lazyredraw  = true
vim.opt.showcmd     = true
vim.opt.cursorline  = true -- Подсветка строки с курсором
vim.opt.wrap        = false
vim.opt.ignorecase  = true
vim.opt.smartcase   = true
vim.opt.showmatch   = true
vim.opt.showmode    = true
vim.opt.hlsearch    = true
vim.opt.incsearch   = true
vim.opt.virtualedit = "all" -- Allow virtual editing in all modes
vim.opt.fileformats = "unix,dos,mac"
-- Backups
vim.opt.backup      = false -- do not keep backup files, it's 70's style
vim.opt.swapfile    = false -- do not write annoying intermediate swap
vim.opt.undofile    = true  -- Возможность отката назад
vim.cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]
vim.opt.shell = 'zsh'

-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.termencoding = 'uft-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileformat = 'unix'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.g.translate_source = 'ru'
vim.g.translate_target = 'en'
vim.cmd [[ set wildignore+=*__pycache__,*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.* ]]

-- Open vim buffer from last visiting
vim.cmd [[
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]

-- RESTORE SESSION (if its posible)
require("auto-session").setup {
  log_level = "error",

  cwd_change_handling = {
    restore_upcoming_session = true,
    pre_cwd_changed_hook = nil,
    post_cwd_changed_hook = function()
      require("lualine").refresh()
    end,
  },
}
