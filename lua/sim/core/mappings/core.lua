local editor_name = 'sim'

local utils = require(string.format('%s.utils', editor_name))
table.unpack = table.unpack or unpack
local map = utils.map

-- use jj/jk to exit insert mode
map('i', 'jj', '<ESC>')
map('i', 'jk', '<ESC>')

-- switch gM and gm - middle of line
map('n', 'gM', 'gm')
map('n', 'gm', 'gM')

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  map('n', 'gX', "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", { desc = 'Open Link' })
else
  map('n', 'gX', "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", { desc = 'Open Link' })
end

-- delete single character without copying into register
-- Don't yank on delete char
map('n', 'x', '"_x')
map('n', 'X', '"_X')
map('v', 'x', '"_x')
map('v', 'X', '"_X')

-- increment/decrement numbers (e.g: 7)
map('n', '+', '<C-a>') -- increment
map('n', '-', '<C-x>') -- decrement
map('n', '0', '^')

-- buffer navigation
--[[ map('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer' }) ]]
--[[ map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Prev Buffer' }) ]]

-- tab navigation
-- TODO: Add rest of tab options : move tabs and much more. check the docs
map('n', 'H', ':tabp<CR>', { desc = 'Previous Tab' })
map('n', 'L', ':tabn<CR>', { desc = 'Next tab Tab' })

-- splits navigation
map('n', '<C-k>', '<C-w>k', { desc = 'Go Upper Split' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go Down Split' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go Right Split' })
map('n', '<C-h>', '<C-w>h', { desc = 'Go Left Split' })
-- vim-maximizer
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
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Text Down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Text Up' })
-- Don't yank on visual paste
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
-- TODO : Add the gC for capitalizing any string
--[[ map('n', 'gC', '', {desc='Capitalize the words'}) ]]

-- FILE
map('n', '<C-s>', '<cmd>w!<cr>', { desc = 'Force write' })
map('i', '<C-s>', '<ESC> :w<CR>', { desc = 'Force write' })
map('n', '<C-q>', 'cmd>q!<cr>', { desc = 'Force quit' })

-- Cmnds
--
-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd([[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]])

-- Manually invoke speeddating in case switch.vim didn't work
map('n', '<C-a>', ':if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>', { desc = '' })
map(
  'n',
  '<C-x>',
  ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>",
  { desc = '' }
)
