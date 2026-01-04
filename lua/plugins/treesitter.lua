-- Treesitter: syntax highlighting, code navigation, text objects
return {
  -- Core treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99

      local parsers = { 'bash', 'c', 'diff', 'go', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'python', 'query', 'typescript', 'vim', 'vimdoc' }
      local filetypes = { 'bash', 'sh', 'c', 'diff', 'go', 'html', 'lua', 'markdown', 'python', 'query', 'typescript', 'vim', 'help' }

      require('nvim-treesitter').install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
          vim.wo[0][0].foldmethod = 'expr'
          vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  -- Show code context at top of screen
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { enable = true, max_lines = 3 },
  },

  -- Smart text objects
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = { lookahead = true },
        move = { set_jumps = true },
      }

      local select = require 'nvim-treesitter-textobjects.select'
      local move = require 'nvim-treesitter-textobjects.move'

      -- Select keymaps
      vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end, { desc = 'Select outer function' })
      vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end, { desc = 'Select inner function' })
      vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', 'textobjects') end, { desc = 'Select outer class' })
      vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', 'textobjects') end, { desc = 'Select inner class' })
      vim.keymap.set({ 'x', 'o' }, 'aa', function() select.select_textobject('@parameter.outer', 'textobjects') end, { desc = 'Select outer parameter' })
      vim.keymap.set({ 'x', 'o' }, 'ia', function() select.select_textobject('@parameter.inner', 'textobjects') end, { desc = 'Select inner parameter' })

      -- Move keymaps
      vim.keymap.set({ 'n', 'x', 'o' }, ']m', function() move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']M', function() move.goto_next_end('@function.outer', 'textobjects') end, { desc = 'Next function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Previous function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end, { desc = 'Previous function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']]', function() move.goto_next_start('@class.outer', 'textobjects') end, { desc = 'Next class start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '][', function() move.goto_next_end('@class.outer', 'textobjects') end, { desc = 'Next class end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[[', function() move.goto_previous_start('@class.outer', 'textobjects') end, { desc = 'Previous class start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[]', function() move.goto_previous_end('@class.outer', 'textobjects') end, { desc = 'Previous class end' })
    end,
  },
}
