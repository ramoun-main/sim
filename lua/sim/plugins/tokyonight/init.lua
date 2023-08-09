local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))

return {
  { -- color scheme
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local config = require(string.format('%s.plugins.tokyonight.config', editor_name))
      require('tokyonight').setup(config)
      vim.cmd('color tokyonight')
    end,
    enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'tokyonight'),
  },
}
