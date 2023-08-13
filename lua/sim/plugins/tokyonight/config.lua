local EditorName = 'sim'

local user_config = require(string.format('%s.core.user', EditorName))
local u = require(string.format('%s.utils', EditorName))

local config = u.merge({
  -- use the night style
  style = 'night',
  light_style = 'moon',
  sidebars = { 'qf', 'packer', 'help' },
}, user_config.plugins.tokyonight or {})

return function()
  require('tokyonight').setup(config)
  vim.cmd('color tokyonight')
end
