-- Markdown live preview in browser
return {
  'iamcco/markdown-preview.nvim',
  ft = 'markdown',
  build = 'cd app && npm install',
  keys = {
    { '<leader>mp', '<CMD>MarkdownPreviewToggle<CR>', ft = 'markdown', desc = '[M]arkdown [P]review' },
  },
}
