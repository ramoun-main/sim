local user_config = require(string.format('%s.core.user', EditorName))
local u = require(string.format('%s.utils', EditorName))

return function()
  require('lspconfig').jsonls.setup(u.merge({
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
  }, user_config.plugins.schemastore or {}))
end
