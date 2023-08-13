local user_config = require(string.format('%s.core.user', EditorName))

local setup = {
  window = {
    border = user_config.border,
    position = 'bottom',
    margin = { 1, 0, 1, 0 },
    padding = { 3, 2, 3, 2 },
    winblend = 20,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 8,
    align = 'center',
  },
}

local keys = {
  ['<leader>'] = {
    b = {
      name = '+buffer',
    },
    c = {
      name = '+quickfix',
    },
    f = {
      name = '+find',
    },
    h = {
      name = '+gitsigns',
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
    g = {
      name = '+goto',
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
}

return function()
  local wk = require('which-key')
  wk.setup(setup)

  wk.register(keys)
end
