-- Colorscheme configuration
-- Change this to switch themes: 'rose-pine', 'tokyonight'
local theme = 'rose-pine'

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = theme == 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        highlight_groups = {
          ['@string.documentation'] = { link = 'Comment' },
          ['@string.documentation.python'] = { link = 'Comment' },
        },
      }
      vim.cmd.colorscheme 'rose-pine'
    end,
  },

  {
    'folke/tokyonight.nvim',
    enabled = theme == 'tokyonight',
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        styles = { comments = { italic = false } },
      }
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
