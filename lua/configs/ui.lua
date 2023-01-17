-- -------------------------------------------
-- Variables
-- -------------------------------------------
local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

-- -------------------------------------------
-- Theme
-- -------------------------------------------
cmd[[colorscheme tokyonight-moon]]

-- -------------------------------------------
-- Theme Config
-- -------------------------------------------
g.tokyonight_style = "storm"
g.tokyonight_italic_comments = true
g.tokyonight_italic_keywords = true
g.tokyonight_transparent_sidebar = false
g.tokyonight_dark_sidebar = true
g.tokyonight_lualine_bold = true
g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- -------------------------------------------
-- Base
-- -------------------------------------------
opt.cursorline = true         -- Подсветка строки с курсором
opt.number = true             -- Включаем нумерацию строк
opt.termguicolors = true      --  24-bit RGB colors
-- opt.so=999                    -- Курсор всегда в центре экрана

-- -------------------------------------------
-- Base
-- -------------------------------------------
cmd[[ set wildignore+=*__pycache__,*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.* ]]

-- Nerdtree config for wildignore
cmd[[ let NERDTreeRespectWildIgnore=1 ]]


