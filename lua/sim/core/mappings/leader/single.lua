local editor_name = 'sim'
local utils = require(string.format('%s.utils', editor_name))
local map = utils.map

-- Main
map('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Quit' })
map('n', '<leader>e', ':NvimTreeToggle<cr>', { desc = 'Toggle Tree' })
map('n', '<leader>qq', ':wqall<cr>', { desc = 'Toggle Tree' })

-- Splits
map('n', '<leader>w', '<C-w>q', { desc = 'Close Split' })

------------------------------------------ Double Leader -----------------------------------------

-- Line Manip.
map('v', '<leader><leader>P', [["_ddP]], { desc = 'Delete Line & Paste Above' })
map('n', '<leader><leader>k', '<cmd>lnext<CR>zz', { desc = 'Move To Locationlist ' })
map('n', '<leader><leader>j', '<cmd>lprev<CR>zz', { desc = '' })
map('n', '<leader><leader>w', '<cmd>set wrap<CR>', { desc = '' })
map('n', '<leader><leader>n', '<cmd>set nowrap<CR>', { desc = '' })

-- Misc
map('n', '<leader><leader>x', '<cmd>!chmod +x %<CR>', { desc = 'Make File Exec' })
map('n', '<leader><leader>;', 'ms<Esc>A;<Esc>`s', { desc = 'add ; EOL' })

-- format
map('n', '<leader><leader>f', vim.lsp.buf.format, { desc = 'Format Current Buffer' })
