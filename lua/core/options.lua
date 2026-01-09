-- Editor options
-- See `:help vim.opt` and `:help option-list`

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse mode
vim.opt.mouse = 'a'

-- Don't show mode in command line (shown in statusline)
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)

-- Indentation
vim.opt.breakindent = true

-- Persistent undo
vim.opt.undofile = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always show signcolumn
vim.opt.signcolumn = 'yes'

-- Faster updates
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace display
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitution preview
vim.opt.inccommand = 'split'

-- Cursor line highlight
vim.opt.cursorline = true

-- Keep context around cursor
vim.opt.scrolloff = 10

-- Prompt to save instead of error
vim.opt.confirm = true
