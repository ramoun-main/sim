local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.which-key.config', EditorName))

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'which-key'),
}
