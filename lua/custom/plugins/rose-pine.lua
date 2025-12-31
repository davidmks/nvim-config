return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      highlight_groups = {
        ['@string.documentation'] = { link = 'Comment' },
        ['@string.documentation.python'] = { link = 'Comment' },
      },
    }
    vim.cmd.colorscheme 'rose-pine'
  end,
}
