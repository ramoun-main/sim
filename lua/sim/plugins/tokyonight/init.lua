package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

local user_config = require(string.format('%s.core.user', editor_name))
return {
  { -- color scheme
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      local config = require(string.format('%s.plugins.tokyonight.config', editor_name))
      require('tokyonight').setup(config)
      vim.cmd('color tokyonight')
    end,
    enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'tokyonight'),
  },
}
