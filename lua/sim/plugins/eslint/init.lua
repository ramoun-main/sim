local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))

return {
  'MunifTanjim/eslint.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
  },
  event = 'InsertEnter',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'nvim-cmp'),
}
