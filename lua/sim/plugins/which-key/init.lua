local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
return {
  'folke/which-key.nvim',
  config = function()
    local wk = require('which-key')
    wk.setup({
      window = {
        border = user_config.border,
        position = 'bottom',
        margin = { 1, 0, 1, 0 },
        padding = { 3, 2, 3, 2 },
        winblend = 7,
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 8,
        align = 'center',
      },
      key_labels = {
        ['<space>'] = 'SPC',
        ['<cr>'] = 'RET',
        ['<tab>'] = 'TAB',
        ['<leader>'] = '',
      },
      icons = {
        separator = '=>', -- symbol used between a key and it's label
        group = '', -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = '<c-j>', -- binding to scroll down inside the popup
        scroll_up = '<c-k>', -- binding to scroll up inside the popup
      },
    })

    wk.register({
      ['<leader>'] = {
        ['<leader>'] = {
          name = '🌟 <leader>',
          [';'] = {
            name = 'semi',
          },
        },
        a = {
          name = '🦾 A.I',
          c = {
            name = '+codeium',
          },
        },
        b = {
          name = '📝 Buffer',
        },
        c = {
          name = '🔧 QuickFix',
        },
        f = {
          name = '🔎 Find',
        },
        g = {
          name = '🐙 Git',
        },
        h = {
          name = '+gitcsigns',
          t = {
            name = '+toggle',
          },
        },
        l = {
          name = '+lsp',
          d = {
            name = '+diagnostics',
          },
          t = {
            name = '+toggle',
          },
          w = {
            name = '+workspace',
          },
        },
        n = {
          name = '+tree',
        },
        s = {
          name = '+save',
        },
        S = {
          name = '+Session',
        },
        t = {
          name = '+tab',
        },
        p = {
          name = '+lazy (plugins)',
        },
        v = {
          name = '+git (vsc)',
          t = {
            name = '+toggle',
          },
        },
      },
    })
  end,
  event = 'VeryLazy',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'which-key'),
}
