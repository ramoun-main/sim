local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.tokyonight.config', EditorName))

return {
  { -- color scheme
    'folke/tokyonight.nvim',
    lazy = false,
    config = config,
    enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'tokyonight'),
  },
}
