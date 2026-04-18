vim.pack.add({
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
})

require('gruvbox').setup{
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  invert_selection = true,
  contrast = '',
  overrides = {
    ['String'] = {
      link = 'GruvboxPurple'
    },
    ['cTypedef'] = {
      link = 'GruvboxRed'
    },
    ['cStructure'] = {
      link = 'GruvboxRed'
    },
    ['cBlock'] = {
      link = 'GruvboxOrange'
    },
    ['@lsp.type.macro.c'] = {
      link = 'GruvboxYellow'
    },
  },
}

vim.cmd.colorscheme('gruvbox')
