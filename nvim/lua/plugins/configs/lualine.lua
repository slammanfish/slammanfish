vim.pack.add({
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
})

require('lualine').setup{
  options = {
    component_separators = '',
    section_separators = {
      left = '',
      right = '',
    },
  },
  sections = {
    lualine_a = { 'filename' },
    lualine_b = { 'filetype' },
    lualine_c = { 'branch' },
    lualine_x = { 'datetime' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
