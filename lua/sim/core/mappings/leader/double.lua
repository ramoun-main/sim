local editor_name = 'sim'
local utils = require(string.format('%s.utils', editor_name))
local map = utils.map

-- Clear Search Highlights
map('n', '<leader>nh', ':nohl<CR>')
map('n', '<CR>', ':noh<CR><CR>')

-- Tab Management & Navigation
map('n', '<leader>to', ':tabnew<CR>', { desc = 'New Tab' })
map('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close Tab' })
map('n', '<leader>tp', ':tabprevious<cr>', { desc = 'Prev Tab' })
map('n', '<leader>tn', ':tabnext<cr>', { desc = 'Next Tab' })

-- Quickfix Locations -- TODO: More Research about it
map('n', '<leader>co', ':copen <cr>', { desc = 'Open List' })
map('n', '<leader>cc', ':cclose <cr>', { desc = 'Close List' })
map('n', '<leader>ck', ':cexpr []<cr>', { desc = 'Clear List' })
map('n', '<leader>cf', ':cfdo %s/', { desc = 'Search & Replace' })
map('n', '<leader>cp', ':cprev<cr>zz', { desc = 'Prev Item' })
map('n', '<leader>cn', ':cnext<cr>zz', { desc = 'Next Item' })

-- Buffer Navigation
map('n', '<leader>bo', '<cmd>enew<cr>', { desc = 'New Buffer' })
map('n', '<leader>bp', ':bprev<cr>', { desc = 'Prev Buffer' })
map('n', '<leader>bn', ':bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bd', ':bdelete<cr>', { desc = 'Delete Buffer' })

-- Splits
map('n', '<leader>sv', '<C-w>v', { desc = 'Split Vertically' })
map('n', '<leader>sh', '<C-w>s', { desc = 'Split Horizontally' })
map('n', '<leader>sx', ':close<CR>', { desc = 'Close Split' })
map('n', '<leader>se', '<C-w>=', { desc = ' Equalize Splits' })

-- Location List
map('n', '<leader>fL', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = 'CI Replace File. word under the cursor',
})

map('n', '<leader>ss', '<cmd>w<cr>', { desc = 'Save' })

-- clear search highlights
map('n', '<leader>nh', ':nohl<CR>')
