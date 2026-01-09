-- Testing
return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- Test adapters
      'nvim-neotest/neotest-python',
      {
        'fredrikaverpil/neotest-golang',
        version = '*',
        build = function()
          vim.system({ 'go', 'install', 'gotest.tools/gotestsum@latest' }):wait()
        end,
      },
      'marilari88/neotest-vitest',
      'nvim-neotest/neotest-jest',
    },
    keys = {
      { '<leader>tn', function() require('neotest').run.run() end, desc = '[T]est [N]earest' },
      { '<leader>tf', function() require('neotest').run.run(vim.fn.expand '%') end, desc = '[T]est [F]ile' },
      { '<leader>ts', function() require('neotest').summary.toggle() end, desc = '[T]est [S]ummary' },
      { '<leader>to', function() require('neotest').output.open { enter = true } end, desc = '[T]est [O]utput' },
      { '<leader>tO', function() require('neotest').output_panel.toggle() end, desc = '[T]est Output Panel' },
      { '<leader>tS', function() require('neotest').run.stop() end, desc = '[T]est [S]top' },
      { '<leader>tw', function() require('neotest').watch.toggle(vim.fn.expand '%') end, desc = '[T]est [W]atch' },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { justMyCode = false },
            runner = 'pytest',
          },
          require 'neotest-golang' {
            runner = 'gotestsum',
          },
          require 'neotest-vitest',
          require 'neotest-jest' {
            jestCommand = 'npm test --',
          },
        },
      }
    end,
  },
}
