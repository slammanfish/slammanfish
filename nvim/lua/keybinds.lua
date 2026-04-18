local m = vim.keymap.set
local c = vim.cmd

m({ 'n', 'i' }, '<A-Left>', '<Home>')
m({ 'n', 'i' }, '<A-Right>', '<End>')

m('n', '<Tab>', '>>')
m('n', '<S-Tab>', '<<')
m('i', '<S-Tab>', '<ESC><<gi')
m('v', '<Tab>', '>gv')
m('v', '<S-Tab>', '<gv')

m('n', '<S-Left>', 'v<Left>')
m('n', '<S-Right>', 'v<Right>')
m('n', '<S-Up>', 'v<Up>')
m('n', '<S-Down>', 'v<Down>')
m('i', '<S-Left>', '<ESC>v<Left>')
m('i', '<S-Right>', '<ESC>v<Right>')
m('i', '<S-Up>', '<ESC>v<Up>')
m('i', '<S-Down>', '<ESC>v<Down>')
m('v', '<S-Left>', '<Left>')
m('v', '<S-Right>', '<Right>')
m('v', '<S-Up>', '<Up>')
m('v', '<S-Down>', '<Down>')

m('n', '<A-Up>', ':m .-2<CR>==', { desc = 'Move line [Up]' })
m('n', '<A-Down>', ':m .+1<CR>==', { desc = 'Move line [Down]' })
m('i', '<A-Up>', '<ESC>:m .-2<CR>==gi', { desc = 'Move line [Up]' })
m('i', '<A-Down>', '<ESC>:m .+1<CR>==gi', { desc = 'Move line [Down]' })
m('v', '<A-Up>', ':m \'<-2<CR>gv=gv', { desc = 'Move line [Up]' })
m('v', '<A-Down>', ':m \'>+1<CR>gv=gv', { desc = 'Move line [Down]' })

m('n', '<leader>h', '<C-w>v', { desc = 'Split window [H]orizontal' })
m('n', '<leader>v', '<C-w>s', { desc = 'Split window [V]ertical' })

m('n', '<C-Left>', '<C-w>h', { desc = 'Switch window [Left]' })
m('n', '<C-Right>', '<C-w>l', { desc = 'Switch window [Right]' })
m('n', '<C-Up>', '<C-w>k', { desc = 'Switch window [Up]' })
m('n', '<C-Down>', '<C-w>j', { desc = 'Switch window [Down]' })

local telescope = require('telescope.builtin')
m('n', '<leader><leader>', telescope.find_files, { desc = 'Search files' })
m('n', '<leader>ss', telescope.grep_string, { desc = '[S]earch [S]tring' })
m('n', '<leader>sn', function() telescope.find_files({ cwd = vim.fn.stdpath('config') }) end, { desc = '[S]earch [N]vim' })

m('n', '<leader>t', ':ToggleTerm size=40 direction=float name=terminal<CR>', { desc = '[T]erminal' })
-- m('t', '<ESC>', '<C-\\><C-n>:ToggleTerm size=40 direction=float name=terminal<CR>', { desc = 'Close Terminal' })

m('n', '<C-h>', ':LspClangdSwitchSourceHeader<CR>')
m('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
m('n', 'h', ':lua vim.lsp.buf.hover()<CR>')
