local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))

return {
  'neovim/nvim-lspconfig',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'nvim-lspconfig'),
}

