local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.schemastore.config', EditorName))

return {
  'b0o/SchemaStore.nvim',
  event = 'VeryLazy',
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'gitsigns'),
}
