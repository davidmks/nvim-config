-- Diff viewer for git
return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iff view' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it file [H]istory' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it repo [H]istory' },
    { '<leader>gQ', '<cmd>DiffviewClose<cr>', desc = '[G]it diff [Q]uit one' },
    {
      '<leader>gq',
      function()
        local lib = require('diffview.lib')
        while lib.get_current_view() do
          vim.cmd('DiffviewClose')
        end
      end,
      desc = '[G]it diff [Q]uit all',
    },
    { '<leader>gm', '<cmd>DiffviewOpen origin/main...HEAD<cr>', desc = '[G]it diff vs [M]ain' },
    { '<leader>gS', '<cmd>DiffviewOpen --staged<cr>', desc = '[G]it diff [S]taged' },
  },
  opts = {
    use_icons = true,
  },
}
