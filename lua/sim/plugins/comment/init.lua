local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.comment.config', EditorName))

return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'comment'),
}
