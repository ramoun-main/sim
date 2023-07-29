local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
return {
  'tpope/vim-fugitive',
  cmd = 'Git',
  init = function()
    require(string.format('%s.plugins.fugitive.mappings', editor_name))
  end,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'fugitive'),
}
