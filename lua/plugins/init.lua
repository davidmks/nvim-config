-- Small utility plugins
return {
  -- Auto-close brackets, quotes, etc.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Detect tabstop and shiftwidth automatically
  'NMAC427/guess-indent.nvim',

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Mini.nvim collection
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings
      require('mini.surround').setup()

      -- Statusline
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  -- Autoformat
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        end
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_organize_imports', 'ruff_format' },
        typescript = { 'biome' },
        typescriptreact = { 'biome' },
        javascript = { 'biome' },
        javascriptreact = { 'biome' },
        json = { 'biome' },
        jsonc = { 'biome' },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
      },
    },
  },

  -- Task runner
  {
    'stevearc/overseer.nvim',
    cmd = { 'OverseerRun', 'OverseerToggle' },
    keys = {
      { '<leader>or', '<cmd>OverseerRun<cr>', desc = '[O]verseer [R]un task' },
      { '<leader>ot', '<cmd>OverseerToggle<cr>', desc = '[O]verseer [T]oggle list' },
      { '<leader>oa', '<cmd>OverseerTaskAction<cr>', desc = '[O]verseer task [A]ction' },
      { '<leader>oq', '<cmd>OverseerQuickAction<cr>', desc = '[O]verseer [Q]uick action' },
    },
    opts = {},
  },

  -- Linting
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        python = { 'ruff' },
        typescript = { 'biomejs' },
        typescriptreact = { 'biomejs' },
        javascript = { 'biomejs' },
        javascriptreact = { 'biomejs' },
        go = { 'golangcilint' },
        json = { 'biomejs' },
        jsonc = { 'biomejs' },
        sh = { 'shellcheck' },
        bash = { 'shellcheck' },
        yaml = { 'yamllint' },
        dockerfile = { 'hadolint' },
      }

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup('lint', { clear = true }),
        callback = function()
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
