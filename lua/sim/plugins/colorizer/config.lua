local user_config = require(string.format('%s.core.user', EditorName))
local u = require(string.format('%s.utils', EditorName))

local defaults = {}

return function()
  require('colorizer').setup(u.merge(defaults, user_config.plugins.colorizer or {}))
end
