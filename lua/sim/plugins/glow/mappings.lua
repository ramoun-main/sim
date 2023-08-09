local editor_name = 'sim'

local map = require(string.format('%s.utils', editor_name)).map

map('n', '<leader><leader>m<CR>', '<cmd>Glow<cr>', { desc = 'Preview Markdown' })
