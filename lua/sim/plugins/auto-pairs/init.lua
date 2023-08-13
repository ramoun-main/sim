local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.auto-pairs.config', EditorName))
local opts = require(string.format('%s.plugins.auto-pairs.opts', EditorName))

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = config,
  opts = opts,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'auto-pairs'),
}
