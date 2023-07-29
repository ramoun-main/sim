local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
--[[ local u = require(string.format('%s.utils', editor_name)) ]]

return {
  'mrjones2014/smart-splits.nvim',
  opts = { ignored_filetypes = { 'nofile', 'quickfix', 'qf', 'prompt' }, ignored_buftypes = { 'nofile' } },
  event = 'BufEnter',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'smart-splits'),
}
