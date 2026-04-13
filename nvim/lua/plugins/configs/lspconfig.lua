vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})

local lsps = require('plugins.configs.lsps')

for server, config in pairs(lsps) do
  vim.lsp.config(server, {
    settings = config,
  })
  vim.lsp.enable(server)
end

for _, group in pairs(vim.fn.getcompletion('@lsp', 'highlight')) do
	vim.api.nvim_set_hl(0, group, {})
end

vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'WarningMsg'
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'WarningMsg'
    },
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})
