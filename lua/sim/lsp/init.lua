package.path = package.path .. ';../../../editor-name.lua'
local editor_name = require('editor-name')

require(string.format('%s.lsp.diagnostics', editor_name))

-- LSP server initialization can be found in mason-lspconfig setup
