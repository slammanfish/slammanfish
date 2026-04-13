vim.pack.add({
  { src = 'https://github.com/terrortylor/nvim-comment' },
  { src = 'https://github.com/folke/todo-comments.nvim' },
})

require('nvim_comment').setup{
  comment_empty = false,
  line_mapping = 'gc',
  operator_mapping = 'gc',
  comment_chunk_text_object = 'ic',
}

require('todo-comments').setup{
  signs = false,
}
