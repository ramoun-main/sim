local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.auto-session.config', EditorName))

return {
  'rmagatti/auto-session',
  lazy = false,
  config = config,
  init = function()
    require(string.format('%s.plugins.auto-session.mappings', EditorName))
  end,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'auto-session'),
}
