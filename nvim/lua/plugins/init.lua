local plugins = {
  'treesitter',
  'blink',
  'mason',
  'lspconfig',
  'autopairs',
  'telescope',
  'terminal',
  'lualine',
  'startup',
  'comments',
  'markview',
  'gruvbox',
}

for _, plug in ipairs(plugins) do
  local ok, error = pcall(require, 'plugins.configs.' .. plug)
  if not ok then
    vim.api.nvim_err_writeln('Failed to load plugin ' .. plug .. '\n\n' .. error)
  end
end
