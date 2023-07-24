local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
return {
  'tpope/vim-fugitive',
  cmd = 'Git',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'fugitive'),
}

