local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
local u = require(string.format('%s.utils', editor_name))
local map = require(string.format('%s.utils', editor_name)).map

local defaults = {}

return {
  'norcalli/nvim-colorizer.lua',
  event = 'BufEnter',
  cmd = { 'ColorizerToggle' },
  config = function()
    require('colorizer').setup(u.merge(defaults, user_config.plugins.colorizer or {}))
    vim.cmd('ColorizerToggle')
    map('n', '<leader>ct', ':ColorizerToggle<CR>')
  end,
  --[[ enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'colorizer'), ]]
  enabled = true,
}
