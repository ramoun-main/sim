package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

local user_config = require(string.format('%s.core.user', editor_name))
return {
  'tpope/vim-fugitive',
  cmd = 'Git',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'fugitive'),
}
