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

local opts = {
  mode = 'n', -- Normal mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local keys = {
  ['<leader>🚀'] = {
    h = {
      name = '+gitsigns',
      t = {
        name = '+toggle',
      },
    },
    n = {
      name = '+tree',
    },
  },
}

local mappings = {
  ['n'] = { '<cmd>enew<cr>', 'New File' },
  ['e'] = { ':NvimTreeToggle<CR>', 'Explorer' },
  ['u'] = { '<cmd>update!<CR>', 'Update' },
  ['s'] = { '<cmd>w<cr>', 'Save' },
  ['q'] = { '<cmd>confirm q<cr>', 'Quit' },

  ['<space>'] = { 'Toggle' },

  b = {
    name = 'Buffer',
    c = { '<Cmd>bd!<Cr>', 'Close current buffer' },
    D = { '<Cmd>%bd|e#|bd#<Cr>', 'Delete all buffers' },
  },

  c = { 'Quickfix' },

  f = { 'Find' },

  l = {
    name = 'Lsp',
    d = { 'Diagnostics' },
    t = { 'Toggle' },
    w = { 'Workspace' },
  },

  i = {
    name = 'Insert',
    [';'] = { 'ms<Esc>A;<Esc>`s', 'Semi' },
    ['/'] = { 'Toggle Comment' },
  },

  S = { 'Session' },

  p = { 'Lazy (plugins)' },

  v = {
    name = 'Git (vsc)',
    t = { 'toggle' },
  },

  t = { 'Tab' },

  x = { 'Split' },

  g = {
    name = 'Git',
    s = { '<cmd>Neogit<CR>', 'Status' },
  },
}

return function()
  local wk = require('which-key')
  wk.setup(setup)

  wk.register(mappings, opts)
end
