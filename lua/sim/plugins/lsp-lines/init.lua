local user_config = require(string.format('%s.core.user', EditorName))
local config = require(string.format('%s.plugins.lsp-lines.config', EditorName))
local mappings = require(string.format('%s.plugins.lsp-lines.config', EditorName))

return {
  url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  keys = mappings,
  config = config,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'lsp_lines'),
}
