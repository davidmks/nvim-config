-- Markdown live preview in browser
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = function()
    require('lazy').load { plugins = { 'markdown-preview.nvim' } }
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    { '<leader>Mp', '<CMD>MarkdownPreviewToggle<CR>', ft = 'markdown', desc = '[M]arkdown [P]review' },
  },
  config = function()
    vim.cmd [[do FileType]]
  end,
}
