local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
local u = require(string.format('%s.utils', editor_name))

local defaults = {
  ensure_installed = {
    'astro',
    'css',
    'go',
    'html',
    'javascript',
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
    'typescript',
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
  rainbow = { enable = true },
}

return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-refactor',
    'RRethy/nvim-treesitter-endwise',
    'p00f/nvim-ts-rainbow',
  },
  event = 'BufEnter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup(u.merge(defaults, user_config.plugins.treesitter or {}))
  end,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'treesitter'),
}
