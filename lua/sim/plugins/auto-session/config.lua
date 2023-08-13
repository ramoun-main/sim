local user_config = require(string.format('%s.core.user', EditorName))
local u = require(string.format('%s.utils', EditorName))

local defaults = {
  pre_save_cmds = { 'NvimTreeClose', 'cclose', 'lua vim.notify.dismiss()' },
  auto_session_enabled = true,
  auto_restore_enabled = true,
  auto_save_enabled = true,
  log_level = 'error',
}

return function()
  require('auto-session').setup(u.merge(defaults, user_config.plugins.auto_session or {}))
end
