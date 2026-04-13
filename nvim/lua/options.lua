local c = vim.cmd
local o = vim.opt
local g = vim.g
local d = vim.diagnostic

local indent = 2
local leader = ' '

g.c_syntax_for_h = 1

g.mapleader = leader
g.maplocalleader = leader

o.number = true
o.relativenumber = true
o.wrap = false
o.tabstop = indent
o.shiftwidth = indent
o.updatetime = 750
o.termguicolors = true
o.showmode = true
o.guicursor = 'a:block'
o.signcolumn = 'no'
o.winborder = 'single'
o.keymodel = 'startsel'
-- o.clipboard = 'unnamedplus'
o.confirm = true

local undodir = vim.fn.stdpath('data') .. '/undo'
o.undofile = true
o.undodir = undodir
o.undolevels = 1000
o.undoreload = 10000
