local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.treesitter.config', EditorName))

return {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufEnter',
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-refactor',
    'RRethy/nvim-treesitter-endwise',
  },
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'treesitter'),
}
