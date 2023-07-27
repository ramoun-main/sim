local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))

return {
  { -- color scheme
    'marko-cerovac/material.nvim',
    lazy = false,
    config = function()
      vim.cmd('color material-deep-ocean')
    end,
    enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'material'),
  },
}
