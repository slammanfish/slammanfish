vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.wrap = false
vim.wo.relativenumber = true
vim.wo.number = true
vim.o.mouse = 'a'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.updatetime = 750
vim.opt.termguicolors = true

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- ts
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- misc
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
		'nvim-lualine/lualine.nvim'
	},
  {
		'm4xshen/autoclose.nvim'
	},
  {
    'tikhomirov/vim-glsl'
  },

  -- lsp
  { 
    'neovim/nvim-lspconfig' 
  },
  { 
    'hrsh7th/nvim-cmp' 
  },
  { 
    'hrsh7th/cmp-nvim-lsp' 
  },
  { 
    'L3MON4D3/LuaSnip' 
  },
  { 
    'saadparwaiz1/cmp_luasnip' 
  },
  
  -- themes
	-- {
	-- 	'morhetz/gruvbox'
	-- },
  {
    "ellisonleao/gruvbox.nvim"
  },
  {
    'folke/tokyonight.nvim'
  }
})

-- ts
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "glsl" },
  highlight = {
    enable = true
  },
}
require('nvim-treesitter.install').compilers = { "zig" }

require("autoclose").setup()

-- lualine

require('lualine').setup({
	options = {
		theme = 'gruvbox',
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_b = { 'filename', 'branch' },
		lualine_c = {
			'%=', --[[ add your center compoentnts here in place of this comment ]]
		},
		lualine_x = { 
			{
				'datetime', 
				style = 'default' 
			}
		},
		lualine_y = { 'filetype', 'progress' },
	},
	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { 'location' },
	},
	tabline = {},
	extensions = {},
})

-- telescope

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', telescope.find_files, {})

-- keybindings

-- alt l/r arrows = sol & eol
vim.keymap.set({'n', 'i'}, '<A-Left>', '<Home>')
vim.keymap.set({'n', 'i'}, '<A-Right>', '<End>')

-- alt u/d arrows = move line
vim.keymap.set({'n', 'i'}, '<A-Up>', '<cmd>m -2<CR>')
vim.keymap.set({'n', 'i'}, '<A-Down>', '<cmd>m +1<CR>')

-- create window splits
vim.keymap.set('n', '<leader>h', '<C-w>v')
vim.keymap.set('n', '<leader>v', '<C-w>s')

-- nav window splits
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Right>', '<C-w>l')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Down>', '<C-w>j')

-- resize
vim.keymap.set('n', '<C-r>s', '<cmd>resize 7<CR>')
vim.keymap.set('n', '<C-r>b', '<cmd>resize 27<CR>')

-- terminal
vim.keymap.set('n', '<leader>t', '<cmd>terminal<CR>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', {noremap = true})

-- tab block
vim.keymap.set("n",    "<Tab>",         ">>",  { noremap = true, silent = true })
vim.keymap.set("n",    "<S-Tab>",       "<<",  { noremap = true, silent = true })
vim.keymap.set("v",    "<Tab>",         ">gv", { noremap = true, silent = true })
vim.keymap.set("v",    "<S-Tab>",       "<gv", { noremap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-\\><C-N><<<C-\\><C-N>^i", { noremap = true, silent = true })

-- select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- save
vim.keymap.set('n', '<C-s>', '<cmd>w!<CR>')

-- switch .c/.h
vim.keymap.set('n', '<C-h>', '<cmd>ClangdSwitchSourceHeader<CR>')

-- def / decl
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.decleration()<CR>')

-- arrow navigation
vim.cmd([[
	" shift+arrow selection
	nmap <S-Up> v<Up>
	nmap <S-Down> v<Down>
	nmap <S-Left> v<Left>
	nmap <S-Right> v<Right>
	vmap <S-Up> <Up>
	vmap <S-Down> <Down>
	vmap <S-Left> <Left>
	vmap <S-Right> <Right>
	imap <S-Up> <Esc>v<Up>
	imap <S-Down> <Esc>v<Down>
	imap <S-Left> <Esc>v<Left>
	imap <S-Right> <Esc>v<Right>

	vmap <C-c> y<Esc>i
	vmap <C-x> d<Esc>i
	map <C-v> pi
	imap <C-v> <Esc>pi
	imap <C-z> <Esc>ui
]])

-- lsp

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

local lsps = { 'clangd', 'lua_ls', 'glsl_analyzer' }

for _, lsp in ipairs(lsps) do
  require('lspconfig')[lsp].setup{}
end

-- Hide all semantic highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end

-- Function to setup undercurl highlights
local function setup_undercurl()
  vim.cmd [[
    hi SpellBad gui=undercurl guisp=Red
    hi SpellCap gui=undercurl guisp=Blue
    hi SpellRare gui=undercurl guisp=Magenta
    hi SpellLocal gui=undercurl guisp=Cyan

    hi DiagnosticUnderlineError gui=undercurl guisp=Red
    hi DiagnosticUnderlineWarn gui=undercurl guisp=Yellow
    hi DiagnosticUnderlineInfo gui=undercurl guisp=Blue
    hi DiagnosticUnderlineHint gui=undercurl guisp=Green

    hi TSError gui=undercurl guisp=Red
    hi TSWarning gui=undercurl guisp=Yellow
    hi TSInfo gui=undercurl guisp=Blue
    hi TSHint gui=undercurl guisp=Green
  ]]
end

-- Setup undercurl highlights on VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
  callback = setup_undercurl,
})

-- vim.cmd([[
--   set termguicolors
--   let g:gruvbox_contrast_dark='hard'
--   let g:gruvbox_contrast_light='hard'
--   colorscheme gruvbox
-- ]])

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    ["@variable"] = { link = "Identifier" },
    ["@operator"] = { link = "GruvboxFg1" },
    ["@lsp.type.enumMember"] = { link = "GruvboxPurple" },
    ["@keyword.operator"] = { link = "GruvboxOrange" },
    
  },
  dim_inactive = false,
  transparent_mode = false,
})

vim.cmd([[
  let g:c_syntax_for_h = 1
  set background=dark
  colorscheme gruvbox
]])

-- neovide

if vim.g.neovide then
	vim.o.guifont = "ZedMono NF:h18"
end