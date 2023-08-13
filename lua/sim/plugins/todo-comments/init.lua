local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.todo-comments.config', EditorName))

return {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  dependencies = 'nvim-lua/plenary.nvim',
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'todo-comments'),
}
