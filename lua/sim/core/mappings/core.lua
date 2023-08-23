local editor_name = 'sim'

local utils = require(string.format('%s.utils', editor_name))
local map = utils.map

-- use jj/jk to exit insert mode
map('i', 'jj', '<ESC>')
map('i', 'jk', '<ESC>')

-- switch gM and gm - middle of line
map('n', 'gM', 'gm')
map('n', 'gm', 'gM')

-- clear search highlights
map('n', '<leader>nh', ':nohl<CR>')

-- delete single character without copying into register
map('n', 'x', '"_x')

-- increment/decrement numbers (e.g: 7)
map('n', '+', '<C-a>') -- increment
map('n', '-', '<C-x>') -- decrement
map('n', '<leader>;', 'ms<Esc>A;<Esc>`s')

-- tab management
map('n', '<leader>to', ':tabnew<CR>', { desc = 'open new tab' })
map('n', '<leader>tx', ':tabclose<CR>', { desc = 'close currentab' })
-- tab navigation
map('n', '<leader>tp', ':tabprevious<cr>', { desc = 'Prev tab' })
map('n', '<leader>tn', ':tabnext<cr>', { desc = 'Next tab' })
map('n', 'H', ':tabp<CR>', { desc = 'go to previous tab' })
map('n', 'L', ':tabn<CR>', { desc = 'go to next tab tab' })

-- Quickfix mappings -- TODO: More Research about it
map('n', '<leader>co', ':copen <cr>', { desc = 'Open List' })
map('n', '<leader>cc', ':cclose <cr>', { desc = 'Close List' })
map('n', '<leader>ck', ':cexpr []<cr>', { desc = 'Clear List' })
map('n', '<leader>cf', ':cfdo %s/', { desc = 'Search & Replace' })
map('n', '<leader>cp', ':cprev<cr>zz', { desc = 'Prev Item' })
map('n', '<leader>cn', ':cnext<cr>zz', { desc = 'Next Item' })

-- buffer navigation
map('n', '<leader>bp', ':bprev<cr>', { desc = 'Prev Buffer' })
map('n', '<leader>bn', ':bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bd', ':bdelete<cr>', { desc = 'Delete Buffer' })

-- splits
map('n', '<leader>sv', '<C-w>v', { desc = 'Split Window Vertically' })
map('n', '<leader>sh', '<C-w>s', { desc = 'Split Window Horizontally' })
map('n', '<leader>sx', ':close<CR>', { desc = 'Close Current Split Window' })
map('n', '<leader>w', '<C-w>q', { desc = 'Close Split' })
-- splits navigation
--[[ map('n', '<C-k>', '<C-w>k', { desc = 'Move to Upper Split' }) ]]
--[[ map('n', '<C-j>', '<C-w>j', { desc = 'Move to Down Split' }) ]]
--[[ map('n', '<C-l>', '<C-w>l', { desc = 'Move to Right Split' }) ]]
--[[ map('n', '<C-h>', '<C-w>h', { desc = 'Move to Left Split' }) ]]
-- vim-maximizer
map('n', '<leader>ie', '<C-w>=', { desc = 'Make Splits Equal' })
map('n', '\\', '<cmd>vsplit<cr>', { desc = 'Vertical Split' })
map('n', '|', '<cmd>split<cr>', { desc = 'Horizontal Split' })

-- Terminal --
-- Better terminal navigation
map('t', '<C-h>', '<C-\\><C-N><C-w>h')
map('t', '<C-j>', '<C-\\><C-N><C-w>j')
map('t', '<C-k>', '<C-\\><C-N><C-w>k')
map('t', '<C-l>', '<C-\\><C-N><C-w>l')

-- Stay in indent mode
map('v', '<S-Tab>', '<gv', { desc = 'Unindent line' })
map('v', '<Tab>', '>gv', { desc = 'Indent line' })

-- line manip.
-- View
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'move a block of text down by one line.' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'move a block of text up by two lines' })
map('v', '<leader>P', [["_dP]], { desc = 'delete the selected text and paste it above the current line' })
map('v', 'p', '"_dP', { desc = 'dont override the paste' })
-- normal
map('n', 'J', 'mzJ`z', { desc = 'join current line and line below it' })
map('n', '<C-d>', '<C-d>zz', {
  desc = 'scrolls the window down by half of its height and then centers the line containing the cursor in the middle of the window',
})
map('n', '<C-u>', '<C-u>zz', {
  desc = 'scrolls the window up by half of its height and then centers the line containing the cursor in the middle of the window.',
})
map('n', 'n', 'nzzzv', { desc = 'repeats the search forward' })
map('n', 'N', 'Nzzzv', { desc = 'repeats the search backward' })

-- yank/delete to system clipboard
map({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'yank (copy) the selected text to the system clipboard register' })
map(
  { 'n', 'v' },
  '<leader>Y',
  [["+Y]],
  { desc = 'yank (copy) the current line, including the newline character, to the system clipboard register' }
)
map(
  { 'n', 'v' },
  '<leader>d',
  [["_d]],
  { desc = 'delete the selected text in visual mode or the current line in normal mode' }
)

-- location list
map('n', '<leader>k', '<cmd>lnext<CR>zz', {
  desc = 'moves the cursor to the next location in the location list and then centers the line containing the cursor in the middle of the window.',
})
map('n', '<leader>j', '<cmd>lprev<CR>zz', {
  desc = 'moves the cursor to the prev location in the location list and then centers the line containing the cursor in the middle of the window.',
})

-- Search
map('n', '<leader>fS', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = 'performs a case-insensitive search and replace operation in the entire file. The word under the cursor is used as the replacement for each occurrence of the matched word',
})

-- format
map('n', '<leader>F', vim.lsp.buf.format, { desc = 'formatting the current buffer' })

--
-- FILE
map('n', '<leader>ss', '<cmd>w<cr>', { desc = 'Save' })
map('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Quit' })
map('n', '<leader>n', '<cmd>enew<cr>', { desc = 'New File' })
map('n', '<C-s>', '<cmd>w!<cr>', { desc = 'Force write' })
map('n', '<C-q>', 'cmd>q!<cr>', { desc = 'Force quit' })
map('n', '<leader>x', '<cmd>!chmod +x %<CR>', { desc = 'makes the current file executable' })
