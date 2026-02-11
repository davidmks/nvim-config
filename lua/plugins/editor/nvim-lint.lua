-- Linting
return {
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
          -- Run actionlint on GitHub Actions workflow files
          if vim.fn.expand '%:p':find '%.github/workflows/' then
            lint.try_lint { 'actionlint' }
          end
        end
      end,
    })
  end,
}
