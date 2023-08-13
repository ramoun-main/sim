local u = require(string.format('%s.utils', EditorName))
local user_config = require(string.format('%s.core.user', EditorName))

return {
  function()
    require('nvim-autopairs').setup(u.merge({
      check_ts = true,
      ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        typescript = { 'string', 'template_string' },
        java = false,
      },
      disable_filetype = { 'TelescopePrompt', 'vim' },
      fast_wrap = {},
    }, user_config.plugins.nvim_autopairs or {}))
  end,
}
