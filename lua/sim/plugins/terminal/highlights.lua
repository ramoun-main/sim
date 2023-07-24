local editor_name = 'sim'

local set_highlight = require(string.format('%s.utils.theme', editor_name)).set_highlight

-- terminal highlights
set_highlight('FloatBorder', {
  guibg = 'None',
})

vim.cmd('hi! link FloatermBorder FloatBorder')

