-- Editor options
-- See `:help vim.o` and `:help option-list`

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse mode
vim.o.mouse = 'a'

-- Don't show mode in command line (shown in statusline)
vim.o.showmode = false

-- Sync clipboard between OS and Neovim
-- vim.schedule(function()
--   vim.o.clipboard = 'unnamedplus'
-- end)

-- Indentation
vim.o.breakindent = true

-- Persistent undo
vim.o.undofile = true

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- Always show signcolumn
vim.o.signcolumn = 'yes'

-- Faster updates
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Split behavior
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace display
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitution preview
vim.o.inccommand = 'split'

-- Cursor line highlight
vim.o.cursorline = true

-- Keep context around cursor
vim.o.scrolloff = 10

-- Prompt to save instead of error
vim.o.confirm = true
