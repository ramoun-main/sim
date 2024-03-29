local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))

return {
  'voldikss/vim-floaterm',
  cmd = { 'FloatermToggle', 'FloatermNew' },
  keys = {
    { '<C-m>', '<cmd>FloatermToggle<cr>', desc = 'Floating Terminal' },
  },
  config = function()
    local g = vim.g
    local title = vim.env.SHELL

    g.floaterm_width = 0.7
    g.floaterm_height = 0.8
    g.floaterm_title = '[' .. title .. ']:($1/$2)'
    g.floaterm_borderchars = '─│─│╭╮╯╰'
    g.floaterm_opener = 'vsplit'

    require(string.format('%s.plugins.terminal.highlights', editor_name))
    require(string.format('%s.plugins.terminal.mappings', editor_name))
  end,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'terminal'),
}
