local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.colorizer.config', EditorName))

return {
  'norcalli/nvim-colorizer.lua',
  event = 'BufEnter',
  cmd = { 'ColorizerToggle' },
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'colorizer'),
}
