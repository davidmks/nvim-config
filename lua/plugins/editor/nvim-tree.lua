-- File tree sidebar
return {
  'nvim-tree/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>e', '<CMD>NvimTreeToggle<CR>', desc = 'File [E]xplorer' },
  },
  opts = {
    filters = {
      dotfiles = true,
    },
    view = {
      width = 35,
    },
    renderer = {
      group_empty = true,
      icons = {
        git_placement = 'after',
        glyphs = {
          git = {
            unstaged = '●',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '✗',
            ignored = '◌',
          },
        },
      },
    },
    update_focused_file = {
      enable = true,
    },
  },
}
