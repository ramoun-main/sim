local user_config = require('cosmic.core.user')
local u = require('cosmic.utils')

return {
  'mrjones2014/smart-splits.nvim',
  opts = { ignored_filetypes = { 'nofile', 'quickfix', 'qf', 'prompt' }, ignored_buftypes = { 'nofile' } },
  event = 'BufEnter',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'smart-splits'),
}
