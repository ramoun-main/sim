local user_config = require(string.format('%s.core.user', EditorName))
local u = require(string.format('%s.utils', EditorName))

local defaults = {
  ensure_installed = {
    'astro',
    'css',
    'go',
    'html',
    'javascript',
    'typescript',
    'jsdoc',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'php',
    'python',
    'regex',
    'scss',
    'tsx',
    'yaml',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
  endwise = { enable = true },
}

return function()
  require('nvim-treesitter.configs').setup(u.merge(defaults, user_config.plugins.treesitter or {}))
end
