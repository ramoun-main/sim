local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.gitsigns.config', EditorName))

return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'gitsigns'),
}
