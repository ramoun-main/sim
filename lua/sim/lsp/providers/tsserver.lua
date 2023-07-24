local editor_name = 'sim'

local default_on_attach = require(string.format('%s.lsp.providers.defaults', editor_name)).on_attach
local M = {}

function M.on_attach(client, bufnr)
  default_on_attach(client, bufnr)

  -- ts utils must be setup on "on_attach"
  require(string.format('%s.plugins.nvim-lsp-ts-utils.setup', editor_name)).setup(client)
end

return M

