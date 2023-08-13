local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.lualine.config', EditorName))

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  config = config,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'lualine'),
}
