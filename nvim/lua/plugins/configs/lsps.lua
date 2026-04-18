return {
  lua_ls = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file('lua', true),
      },
    },
  },
  clangd = {},
  jedi_language_server = {},
  glsl_analyzer = {},
}
