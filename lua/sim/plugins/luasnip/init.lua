local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.luasnip.config', EditorName))

return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'luasnip'),
}
