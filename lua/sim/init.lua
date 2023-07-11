package.path = package.path .. ';../editor_name.lua'
local editor_name = require('editor-name')

require(string.format('%s.core', editor_name))
