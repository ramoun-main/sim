local editor_name = 'sim'

local map = require(string.format('%s.utils', editor_name)).map

map('n', '<C-m>', ':FloatermToggle<CR>', { desc = 'Toggle Floaterm' })
map('t', '<C-m>', [[<C-\><C-n>]], { desc = 'Close Floaterm' })
-- map('t', '<C-w>l', [[<C-\><C-n>:FloatermNext<CR>]], { desc = 'Next terminal' })
-- map('t', '<C-w>h', [[<C-\><C-n>:FloatermPrev<CR>]], { desc = 'Prev terminal' })
-- map('t', '<C-w>n', [[<C-\><C-n>:FloatermNew<CR>]], { desc = 'New terminal' })
-- map('t', '<C-w>c', [[<C-\><C-n>:FloatermKill<CR>]], { desc = 'Kill current terminal' })
