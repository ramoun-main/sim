local user_config = require(string.format('%s.core.user', EditorName))
local u = require(string.format('%s.utils', EditorName))
local vt_config = require(string.format('%s.lsp.diagnostics.config', EditorName))
local is_plugin_enabled = user_config.plugins.lsp_lines.enable_on_start

local Utils = {}

function Utils.toggle()
  if is_plugin_enabled then
    vim.diagnostic.config(u.merge(vt_config, {
      virtual_text = false,
      virtual_lines = true,
    }))
  else
    vim.diagnostic.config(u.merge(vt_config, {
      virtual_lines = false,
    }))
  end
  is_plugin_enabled = not is_plugin_enabled
end

return Utils
