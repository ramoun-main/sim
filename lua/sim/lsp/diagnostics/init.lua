package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

local icons = require(string.format('%s.utils.icons', editor_name))
local config = require(string.format('%s.lsp.diagnostics.config', editor_name))

-- set up LSP signs
local signs = {
  Error = icons.error .. ' ',
  Warn = icons.warn .. ' ',
  Hint = icons.hint .. ' ',
  Info = icons.info .. ' ',
}

-- Set up diagnostic signs
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- set up diagnostics
vim.diagnostic.config(config)
