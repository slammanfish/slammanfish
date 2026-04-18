vim.pack.add({
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
})

local lsps = require('plugins.configs.lsps')

require('mason').setup({})

require('mason-lspconfig').setup({})

require('mason-tool-installer').setup({
  ensure_installed = vim.tbl_keys(lsps),
})
