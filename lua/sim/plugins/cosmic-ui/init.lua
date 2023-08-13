local user_config = require(string.format('%s.core.user', EditorName))
local init = require(string.format('%s.plugins.cosmic-ui.ini', EditorName))
local config = require(string.format('%s.plugins.cosmic-ui.config', EditorName))

return {
  'CosmicNvim/cosmic-ui',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  init = init,
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'cosmic-ui'),
}
