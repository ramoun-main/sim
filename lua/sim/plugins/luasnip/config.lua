local user_config = require(string.format('%s.core.user', EditorName))
local u = require(string.format('%s.utils', EditorName))

return function()
  local ls = require('luasnip')
  ls.config.set_config(u.merge({
    history = true,
    -- Update more often, :h events for more info.
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
  }, user_config.plugins.luasnip or {}))

  -- extend html snippets to react files
  require('luasnip').filetype_extend('javascriptreact', { 'html' })
  require('luasnip').filetype_extend('typescriptreact', { 'html' })

  -- load snippets (friendly-snippets)
  require('luasnip.loaders.from_vscode').lazy_load()
end
