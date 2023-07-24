local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
return user_config.add_plugins

