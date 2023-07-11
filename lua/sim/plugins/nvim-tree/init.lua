package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

local user_config = require(string.format('%s.core.user', editor_name))
local icons = require(string.format('%s.utils.icons', editor_name))
local u = require(string.format('%s.utils', editor_name))

-- set up args
local args = {
  respect_buf_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = icons.hint,
      info = icons.info,
      warning = icons.warn,
      error = icons.error,
    },
  },
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 35,
    number = true,
    relativenumber = true,
  },
  git = {
    ignore = true,
  },
  renderer = {
    highlight_git = true,
    special_files = {},
    icons = {
      glyphs = {
        default = '',
        symlink = icons.symlink,
        git = icons.git,
        folder = icons.folder,
      },
    },
  },
}

return {
  'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup(u.merge(args, user_config.plugins.nvim_tree or {}))
  end,
  init = function()
    local map = require(string.format('%s.utils', editor_name)).map

    map('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle Tree' })
    map('n', '<leader>nt', ':NvimTreeToggle<CR>', { desc = 'Toggle Tree' })
    map('n', '<leader>nr', ':NvimTreeRefresh<CR>', { desc = 'Refresh Tree' })
  end,
  cmd = {
    'NvimTreeClipboard',
    'NvimTreeFindFile',
    'NvimTreeOpen',
    'NvimTreeRefresh',
    'NvimTreeToggle',
  },
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'nvim-tree'),
}
