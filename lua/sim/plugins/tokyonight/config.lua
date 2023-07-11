package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

local user_config = require(string.format('%s.core.user', editor_name))
local u = require(string.format('%s.utils', editor_name))

local config = u.merge({

  -- use the night style
  style = 'night',
  light_style = 'moon',
  sidebars = { 'qf', 'packer', 'help' },
}, user_config.plugins.tokyonight or {})

return config
