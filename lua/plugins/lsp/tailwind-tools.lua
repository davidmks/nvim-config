-- Tailwind CSS utilities (color hints, class sorting, smart increment)
return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    server = {
      override = false, -- LSP is already configured in lspconfig.lua
    },
  },
}
