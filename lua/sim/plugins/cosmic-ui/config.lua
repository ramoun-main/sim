local user_config = require(string.format('%s.core.user', EditorName))
local utils = require(string.format('%s.utils', EditorName))

local defaults = {
  border_style = 'rounded',
}

return function()
  require('cosmic-ui').setup(utils.merge(defaults, user_config.plugins.cosmic_ui or {}))
end
