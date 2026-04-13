vim.opt.termguicolors = true
vim.deprecate = function() end

local configs = {
  'options',
  'plugins',
  'keybinds',
  'autocmds',
}

for _, fig in ipairs(configs) do
  local ok, error = pcall(require, fig)
  if not ok then
    vim.api.nvim_err_writeln('Failed to load ' .. fig .. '\n\n' .. error)
  end
end
