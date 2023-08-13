local opts = require(string.format('%s.plugins.nvim-ufo.opts', EditorName))

return {
  'kevinhwang91/nvim-ufo',
  event = 'BufEnter',
  dependencies = { 'kevinhwang91/promise-async' },
  opts = opts,
}
