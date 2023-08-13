local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.terminal.config', EditorName))

local keys = {
  { '<C-l>', '<cmd>FloatermToggle<cr>', desc = 'Floating Terminal' },
}

return {
  'voldikss/vim-floaterm',
  cmd = { 'FloatermToggle', 'FloatermNew' },
  keys = keys,
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'terminal'),
}
