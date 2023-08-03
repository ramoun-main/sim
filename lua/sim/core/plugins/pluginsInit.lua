local editor_name = 'sim'

local u = require(string.format('%s.utils.update', editor_name, editor_name))
local user_config = require(string.format('%s.core.user', editor_name))

require('lazy').setup(string.format('%s.plugins', editor_name), {
  lockfile = u.get_install_dir() .. '/lazy-lock.json',
  defaults = { lazy = true },
  install = { colorscheme = { "material" } },
  checker = { enabled = true },
  ui = {
    border = user_config.border,
    size = { width = 0.7, height = 0.7 },
  },
  debug = false,
  performance = {
    rtp = {
      disabled_plugins = {
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'gzip',
        'zip',
        'zipPlugin',
        'tar',
        'tarPlugin',
        'getscript',
        'getscriptPlugin',
        'vimball',
        'vimballPlugin',
        '2html_plugin',
        'logipat',
        'rrhelper',
        'spellfile_plugin',
        'matchit',
        "tohtml",
        "tutor",
      },
    },
  },
})

