vim.pack.add({
  { src = 'https://github.com/akinsho/toggleterm.nvim' },
})

require('toggleterm').setup({
  on_open = function(t)
    vim.cmd('startinsert!')
    vim.api.nvim_buf_set_keymap(t.bufnr, 't', '<ESC>', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
  on_close = function(t)
    vim.cmd('startinsert!')
  end,
})
