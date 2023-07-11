package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

local user_config = require(string.format('%s.core.user', editor_name))
local u = require(string.format('%s.utils', editor_name))

local defaults = {
  pre_save_cmds = { 'NvimTreeClose', 'cclose', 'lua vim.notify.dismiss()' },
  auto_session_enabled = true,
  auto_restore_enabled = true,
  auto_save_enabled = true,
}

return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    require('auto-session').setup(u.merge(defaults, user_config.plugins.auto_session or {}))
  end,
  init = function()
    require(string.format('%s.plugins.auto-session.mappings', editor_name))
  end,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'auto-session'),
}
