local toggle = require(string.format('%s.plugins.lsp-lines.utils', EditorName)).toggle

return {
  {
    '<leader>ltl',
    toggle,
    desc = 'Toggle LSP Lines',
  },
}
