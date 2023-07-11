package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

local set_highlight = require(string.format('%s.utils.theme', editor_name)).set_highlight

-- terminal highlights
set_highlight('FloatBorder', {
  guibg = 'None',
})

vim.cmd('hi! link FloatermBorder FloatBorder')
