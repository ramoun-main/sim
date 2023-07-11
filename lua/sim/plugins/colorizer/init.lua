package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

local user_config = require(string.format('%s.core.user', editor_name))
local u = require(string.format('%s.utils', editor_name))

return {
  'norcalli/nvim-colorizer.lua',
  cmd = { 'ColorizerToggle' },
  config = function()
    require('colorizer').setup(u.merge({}, user_config.plugins.colorizer or {}))
  end,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'colorizer'),
}
