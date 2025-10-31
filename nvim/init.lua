-- opts
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.updatetime = 750
vim.o.termguicolors = true
vim.o.showmode = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.guicursor = 'a:block'
vim.o.signcolumn = 'no'
vim.o.winborder = 'single'
vim.o.keymodel = 'startsel'

-- keymaps
do
	local opts = { noremap = true, silent = true }

	-- save (ctrl s)
	vim.keymap.set('n', '<C-s>', ':write!<CR>', opts)

	-- yank to system (space y/d)
	vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>', opts)
	vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>', opts)

	-- create splits (space h/v)
	vim.keymap.set('n', '<leader>h', '<C-w>v', opts)
	vim.keymap.set('n', '<leader>v', '<C-w>s', opts)

	-- navigate splits (ctrl u/d/l/r)
	vim.keymap.set('n', '<C-Left>', '<C-w>h', opts)
	vim.keymap.set('n', '<C-Right>', '<C-w>l', opts)
	vim.keymap.set('n', '<C-Up>', '<C-w>k', opts)
	vim.keymap.set('n', '<C-Down>', '<C-w>j', opts)

	-- start and end of line (alt l/r)
	vim.keymap.set({ 'n', 'i' }, '<A-Left>', '<Home>', opts)
	vim.keymap.set({ 'n', 'i' }, '<A-Right>', '<End>', opts)

	-- move line (alt u/d)
	vim.keymap.set('n', '<A-Down>', ":m .+1<CR>==", opts)
	vim.keymap.set('n', '<A-Up>', ":m .-2<CR>==", opts)
	vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", opts)
	vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", opts)

	-- tab line (shift tab / tab)
	vim.keymap.set('n', '<Tab>', '>>', opts)
	vim.keymap.set('n', '<S-Tab>', '<<', opts)
	vim.keymap.set('v', '<Tab>', '>gv', opts)
	vim.keymap.set('v', '<S-Tab>', '<gv', opts)
	vim.keymap.set('i', '<S-Tab>', '<C-\\><C-N><<<C-\\><C-N>^i', opts)

	-- format (space f)
	vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)

	-- grep (space space / ctrl f)
	vim.keymap.set('n', '<leader><leader>', ':Telescope find_files<CR>', opts)
	vim.keymap.set('n', '<C-f>', ':Telescope live_grep<CR>', opts)

	-- hover (h)
	vim.keymap.set('n', 'h', ':lua vim.lsp.buf.hover()<CR>', opts)

	-- switch src/header (ctrl h)
	vim.keymap.set('n', '<C-h>', ':LspClangdSwitchSourceHeader<CR>')

	-- goto defenition/decleration
	vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
	vim.keymap.set('n', 'gD', ':lua vim.lsp.buf.decleration()<CR>')

	-- terminal
	vim.keymap.set('n', '<leader>t', ':ToggleTerm size=40 dir=./bin direction=float name=terminal<CR>')
	vim.keymap.set('t', '<Esc>', '<cmd>ToggleTerm size=40 dir=./bin direction=float name=terminal<CR>')
end

-- plugins
vim.pack.add {
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/saghen/blink.cmp' },
	{ src = 'https://github.com/akinsho/toggleterm.nvim' },
	{ src = 'https://github.com/folke/todo-comments.nvim' },
	{ src = 'https://github.com/terrortylor/nvim-comment' },
	{ src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
	{ src = 'https://github.com/tikhomirov/vim-glsl' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/OXY2DEV/markview.nvim' },
	{ src = 'https://github.com/max397574/startup.nvim' },
	{ src = 'https://github.com/ellisonleao/gruvbox.nvim' },
	{ src = 'https://github.com/drewxs/ash.nvim' },
	{ src = 'https://github.com/vim-scripts/DarkZen-Color-Scheme' },
	{ src = 'https://github.com/bluz71/vim-moonfly-colors' },
	{ src = 'https://github.com/webhooked/kanso.nvim' },
	{ src = 'https://github.com/ramojus/mellifluous.nvim' },
	{ src = 'https://github.com/aktersnurra/no-clown-fiesta.nvim' },
	{ src = 'https://github.com/rose-pine/neovim' },
}

require 'nvim-treesitter.configs'.setup {
	ensure_installed = { 'c', 'lua', 'glsl', 'zig', 'todotxt', 'json', 'markdown', 'markdown_inline', 'html', 'latex', 'typst', 'yaml' },
	highlight = {
		enable = true,
	},
}

require 'nvim-treesitter.install'.compilers = { 'zig' }

require 'telescope'.setup {}

require 'blink.cmp'.setup {
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
		menu = {
			draw = {
				-- show our custom kind text instead of an icon column
				columns = { { 'kind' }, { 'label', 'label_description', gap = 1 } },
				components = {
					-- Replace the built-in 'kind' text with single letters
					kind = {
						-- choose whatever letters you like here
						text = function(ctx)
							local map = {
								Function = 'f',
								Method = 'f',
								Constructor = 'f',
								Class = 't',
								Struct = 't',
								Interface = 't',
								TypeParameter = 't',
								Variable = 'v',
								Field = 'v',
								Property = 'v',
								Value = 'v',
								Constant = 'c',
								Enum = 'e',
								EnumMember = 'e',
								Module = 'm',
								Namespace = 'n',
								Package = 'p',
								File = 'F',
								Folder = 'D',
								Keyword = 'k',
								Snippet = 's',
								Text = 't',
							}
							local ch = map[ctx.kind] or (ctx.kind and ctx.kind:sub(1, 1) or '?')
							return ch .. ' '
						end,
						-- keep the same highlight Blink would have used for the kind
						highlight = function(ctx) return ctx.kind_hl end,
					},
				},
			},
		},
	},
	fuzzy = { implementation = 'lua' },
}

require 'toggleterm'.setup {
	on_open = function(t)
		vim.cmd('startinsert')
	end
}

require 'todo-comments'.setup {
	signs = false,
}

require 'nvim_comment'.setup {
	comment_empty = false,
	line_mapping = 'gc',
	operator_mapping = 'gc',
	comment_chunk_text_object = 'ic',
}

require 'ibl'.setup {
	indent = {
		char = '╏',
		priority = 2,
	},
	scope = {
		char = '┃',
		priority = 2,
		show_start = false,
		show_end = false,
	},
}

require 'lualine'.setup {
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

require 'startup'.setup {
	theme = 'slammanfish'
}

require 'gruvbox'.setup {
	italic = {
		strings = false,
		emphasis = false,
		comments = false,
		operators = false,
		folds = false,
	},
	invert_selection = true,
	contrast = 'hard',
	overrides = {
		['@variable'] = {
			link = 'Identifier',
		},
		['@operator'] = {
			link = 'GruvboxFg1',
		},
		['@lsp.type.enumMember'] = {
			link = 'GruvboxPurple',
		},
		['@keyword.operator'] = {
			link = 'GruvboxOrange',
		},
		['@keyword.modifier'] = {
			link = 'GruvboxOrange',
		},
		['@lsp.type.namespace'] = {
			link = 'GruvboxPurple'
		},
		['@property.json'] = {
			link = 'GruvboxGreen'
		},
		['@punctuation.bracket.json'] = {
			link = 'GruvboxFg1'
		},
		['@punctuation.delimiter.json'] = {
			link = 'GruvboxFg1'
		},
		['@string'] = {
			link = 'GruvboxPurple'
		},
		['@lsp.type.macro.c'] = {
			link = 'GruvboxGreenBold'
		}
	},
}

-- vim.cmd.colorscheme('gruvbox')
-- vim.cmd.colorscheme('lunaperche')
-- vim.cmd.colorscheme('quiet')
-- vim.cmd.colorscheme('DarkZen')
-- vim.cmd.colorscheme('moonfly')
-- vim.cmd.colorscheme('kanso')
vim.cmd.colorscheme('mellifluous')
-- vim.cmd.colorscheme('no-clown-fiesta')
-- vim.cmd.colorscheme('rose-pine')

-- lsp
local lsps = { 'clangd', 'lua_ls', 'glsl_analyzer', 'zls' }

vim.lsp.enable(lsps)

config = function()
	local caps = require 'blink.cmp'.get_lsp_capabilities(config.capabilities)
	for _, lsp in pairs(lsps) do
		require 'lspconfig'[lsp].setup { capabilities = caps }
	end
end

for _, group in pairs(vim.fn.getcompletion('@lsp', 'highlight')) do
	vim.api.nvim_set_hl(0, group, {})
end

vim.diagnostic.config {
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '',
			[vim.diagnostic.severity.WARN] = '',
			[vim.diagnostic.severity.INFO] = '',
			[vim.diagnostic.severity.HINT] = '',
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = 'WarningMsg'
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = 'WarningMsg'
		},
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
}

vim.cmd [[
	let g:c_syntax_for_h = 1
  autocmd! BufNewFile,BufRead *.vsh,*.fsh,*.csh set ft=glsl
  autocmd! BufNewFile,BufRead *.txt set ft=todotxt
]]

if vim.g.neovide then
	vim.o.guifont = "Cascadia Code:h15"
end
