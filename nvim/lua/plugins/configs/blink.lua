vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp' },
})

require('blink.cmp').setup {
  fuzzy = { implementation = 'lua' },
  signature = { enabled = true },
  keymap = {
    preset = 'none',
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
  },
  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      }
    },
  },
}
