local map = require(string.format('%s.utils', EditorName)).map
local toggle = require(string.format('%s.plugins.lsp-lines.utils', EditorName)).toggle

return function()
  -- init lsp_lines
  require('lsp_lines').setup()
  -- run once to properly show/hide based on user config
  toggle()
  -- map for toggling lines
  map('n', '<leader>ltl', '', {
    callback = toggle,
    desc = 'Toggle LSP Lines',
  })
end
