vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

require('nvim-treesitter.install').update('all')

require('nvim-treesitter').setup{
  install_dir = vim.fn.stdpath('data') .. '/site',
  auto_install = true,
}

require('nvim-treesitter').install({
  'c',
  'cpp',
  'go',
  'zig',
  'python',
  'lua',
  'json',
  'yaml',
  'markdown',
  'vim',
  'glsl',
  'latex',
  'typst',
  'cmake',
})

-- require('nvim-treesitter').setup{
--   ensure_installed = {
--     'c',
--     'cpp',
--     'go',
--     'zig',
--     'python',
--     'lua',
--     'json',
--     'yaml',
--     'markdown',
--     'vim',
--     'glsl',
--     'latex',
--     'typst',
--     'cmake',
--   },
--   highlight = {
--     enable = true,
--     use_languagetree = true,
--   },
--   indent = {
--     enable = true,
--   },
--   autotag = {
--     enable = true,
--   },
--   context_commentstring = {
--     enable = true,
--     enable_autocmd = false,
--   },
--   refactor = {
--     highlight_definitions = {
--       enable = true,
--     },
--     highlight_current_scope = {
--       enable = false,
--     },
--   },
-- }
