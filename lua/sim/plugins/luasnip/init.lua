local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
local u = require(string.format('%s.utils', editor_name))
local map = require(string.format('%s.utils', editor_name)).map

return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require('luasnip')
    ls.config.set_config(u.merge({
      history = true,
      -- Update more often, :h events for more info.
      updateevents = 'TextChanged,TextChangedI',
      enable_autosnippets = true,
    }, user_config.plugins.luasnip or {}))

    -- extend html snippets to react files
    require('luasnip').filetype_extend('javascriptreact', { 'html', 'css', 'js' })
    require('luasnip').filetype_extend('typescriptreact', { 'html', 'css', 'js' })

    -- load snippets (friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'luasnip'),
}
