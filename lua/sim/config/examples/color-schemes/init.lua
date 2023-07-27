local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))

return {
  { -- material
    'marko-cerovac/material.nvim',
    lazy = false,
    config = function()
      vim.cmd('color material')
    end,
    enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'material'),
  },
  { -- ayu
    'Shatur/neovim-ayu',
    lazy = false,
    config = function()
      vim.cmd('color ayu')
    end,
    enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'ayu'),
  },
  { -- ayu-vim
    'ayu-theme/ayu-vim',
  },
  { -- tokyonight
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      local config = require(string.format('%s.plugins.color-schemes.tokyonight_config', editor_name))
      require('tokyonight').setup(config)
      vim.cmd('color tokyonight')
    end,
    enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'tokyonight'),
  },
  { -- gotham
    'whatyouhide/vim-gotham',
  },
  { -- iceberg
    'cocopon/iceberg.vim',
  },
  { -- papercolor
    'NLKNguyen/papercolor-theme',
  },
  { -- onehalf
    'sonph/onehalf',
  },
  { -- onedark
    'joshdick/onedark.vim',
  },
  { -- vimone
    'rakr/vim-one',
  },
  { -- oceanic-material
    'nvimdev/oceanic-material',
  },
  { -- oceanic-next
    'mhartington/oceanic-next',
  },
  { -- vim nord
    'nordtheme/vim',
  },
  { -- molokayo
    'fmoralesc/molokayo',
  },
  { -- minimalist
    'dikiaap/minimalist',
  },
  { -- lucid
    'cseelus/vim-colors-lucid',
  },
  { -- Sierra
    'AlessandroYorba/Sierra',
  },
  { -- sonokai
    'sainnhe/sonokai',
  },
  { -- SpaceCamp
    'jaredgorski/SpaceCamp',
  },
  { -- sunbather
    'nikolvs/vim-sunbather',
  },
  { -- tender
    'jacoborus/tender.vim',
  },
  { -- firewatch
    'rakr/vim-two-firewatch',
  },
  { -- vimspectr
    'haystackandroid/vimspectr',
  },
}
