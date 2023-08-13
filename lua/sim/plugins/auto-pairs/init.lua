local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.auto-pairs.config', EditorName))

return {
  'windwp/nvim-autopairs',
  config = config,
  event = 'InsertEnter',
  opts = {
    check_ts = true,
    ts_config = { java = false },
    fast_wrap = {
      map = '<C-e>',
      chars = { '{', '[', '(', '"', "'", '<' },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
      offset = 0,
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'PmenuSel',
      highlight_grey = 'LineNr',
    },
  },
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'autopairs'),
}
