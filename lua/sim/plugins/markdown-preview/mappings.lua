local editor_name = 'sim'

local map = require(string.format('%s.utils', editor_name)).map

map('n', '<leader><leader>mo', '<cmd>MPOpen<cr>', { desc = 'MDP Open' })
map('n', '<leader><leader>mx', '<cmd>MPClose<cr>', { desc = 'MDP Close' })
map('n', '<leader><leader>mr', '<cmd>MPRefresh<cr>', { desc = 'MD Refresh' })
