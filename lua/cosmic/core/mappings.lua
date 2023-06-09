local map = require('cosmic.utils').map
local utils = require('cosmic.utils')
local is_available = utils.is_available

local maps = { i = {}, n = {}, v = {}, t = {} }

-- Quickfix mappings
map('n', '<leader>ck', ':cexpr []<cr>', { desc = 'Clear list' })
map('n', '<leader>cc', ':cclose <cr>', { desc = 'Close list' })
map('n', '<leader>co', ':copen <cr>', { desc = 'Open list' })
map('n', '<leader>cf', ':cfdo %s/', { desc = 'Search & Replace' })
map('n', '<leader>cp', ':cprev<cr>zz', { desc = 'Prev Item' })
map('n', '<leader>cn', ':cnext<cr>zz', { desc = 'Next Item' })

-- buffer navigation
map('n', '<leader>bp', ':bprev<cr>', { desc = 'Prev buffer' })
map('n', '<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
map('n', '<leader>bd', ':bdelete<cr>', { desc = 'Delete buffer' })

-- tab navigation
map('n', '<leader>tp', ':tabprevious<cr>', { desc = 'Prev tab' })
map('n', '<leader>tn', ':tabnext<cr>', { desc = 'Next tab' })
map('n', '<leader>td', ':tabclose<cr>', { desc = 'Close tab' })

-- plugin management
map('n', '<leader>pc', ':Lazy check<cr>', { desc = 'Check plugins' })
map('n', '<leader>pu', ':Lazy update<cr>', { desc = 'Update plugins' })
map('n', '<leader>ps', ':Lazy show<cr>', { desc = 'Show plugins' })
map('n', '<leader>ph', ':Lazy help<cr>', { desc = 'Help' })
map('n', '<leader>pp', ':Lazy profile<cr>', { desc = 'Profile' })
map('n', '<leader>pl', ':Lazy logs<cr>', { desc = 'Logs' })
map('n', '<leader>px', ':Lazy clear<cr>', { desc = 'Clear uninstalled plugins' })
map('n', '<leader>pr', ':Lazy restore<cr>', { desc = 'Restore plugins from lockfile' })

-- resize with arrows
map('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize -2' })
map('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize +2' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Vertical Resize -2' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Vertical Resize +2' })

-- my custom remaps (entrirely)

-- use jj/jk to exit insert mode
map('i', 'jj', '<ESC>')
map('i', 'jk', '<ESC>')

-- clear search highlights
map('n', '<leader>nh', ':nohl<CR>')

-- delete single character without copying into register
map('n', 'x', '"_x')

-- increment/decrement numbers
map('n', '<leader>+', '<C-a>') -- increment
map('n', '<leader>-', '<C-x>') -- decrement

-- window management
map('n', '<leader>sv', '<C-w>v') -- split window vertically
map('n', '<leader>sh', '<C-w>s') -- split window horizontally
map('n', '<leader>se', '<C-w>=') -- make split windows equal width & height
map('n', '<leader>sx', ':close<CR>') -- close current split window

map('n', '<leader>to', ':tabnew<CR>') -- open new tab
map('n', '<leader>tx', ':tabclose<CR>') -- close current tab
map('n', '<leader>tn', ':tabn<CR>') --  go to next tab
map('n', '<leader>tp', ':tabp<CR>') --  go to previous tab

-- sidebar

map('n', '<leader>e', ':NvimTreeToggle<CR>') -- toggle file explorer

if is_available('smart-splits.nvim') then
  map('n', '<C-h>', function()
    require('smart-splits').move_cursor_left()
  end)
  map('n', '<C-j>', function()
    require('smart-splits').move_cursor_down()
  end, { desc = 'Move to below split' })
  --[[ maps.n['<C-k>'] = { ]]
  --[[   function() ]]
  --[[     require('smart-splits').move_cursor_up() ]]
  --[[   end, ]]
  --[[   desc = 'Move to above split', ]]
  --[[ } ]]
  --[[ maps.n['<C-l>'] = { ]]
  --[[   function() ]]
  --[[     require('smart-splits').move_cursor_right() ]]
  --[[   end, ]]
  --[[   desc = 'Move to right split', ]]
  --[[ } ]]
  --[[ maps.n['<C-Up>'] = { ]]
  --[[   function() ]]
  --[[     require('smart-splits').resize_up() ]]
  --[[   end, ]]
  --[[   desc = 'Resize split up', ]]
  --[[ } ]]
  --[[ maps.n['<C-Down>'] = { ]]
  --[[   function() ]]
  --[[     require('smart-splits').resize_down() ]]
  --[[   end, ]]
  --[[   desc = 'Resize split down', ]]
  --[[ } ]]
  --[[ maps.n['<C-Left>'] = { ]]
  --[[   function() ]]
  --[[     require('smart-splits').resize_left() ]]
  --[[   end, ]]
  --[[   desc = 'Resize split left', ]]
  --[[ } ]]
  --[[ maps.n['<C-Right>'] = { ]]
  --[[   function() ]]
  --[[     require('smart-splits').resize_right() ]]
  --[[   end, ]]
  --[[   desc = 'Resize split right', ]]
  --[[ } ]]
else
  map('n', '<leader>hi', '<cmd>echo "hello"<cr>', { desc = 'Move to left split' })
  --[[ maps.n['<C-j>'] = { '<C-w>j', desc = 'Move to below split' } ]]
  --[[ maps.n['<C-k>'] = { '<C-w>k', desc = 'Move to above split' } ]]
  --[[ maps.n['<C-l>'] = { '<C-w>l', desc = 'Move to right split' } ]]
  --[[ maps.n['<C-Up>'] = { '<cmd>resize -2<CR>', desc = 'Resize split up' } ]]
  --[[ maps.n['<C-Down>'] = { '<cmd>resize +2<CR>', desc = 'Resize split down' } ]]
  --[[ maps.n['<C-Left>'] = { '<cmd>vertical resize -2<CR>', desc = 'Resize split left' } ]]
  --[[ maps.n['<C-Right>'] = { '<cmd>vertical resize +2<CR>', desc = 'Resize split right' } ]]
end

--[[ map('n', '<C-j>', '<C-w>j', { desc = 'Move to below split' }) ]]
--[[ map('n', '<C-k>', '<C-w>k', { desc = 'Move to above split' }) ]]
--[[ map('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' }) ]]
--[[ map('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Resize split up' }) ]]
--[[ map('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Resize split down' }) ]]
--[[ map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Resize split left' }) ]]
--[[ map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Resize split right' }) ]]

--[[ maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" } ]]
-- [[ maps.n["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" } ]])
--  ([[ maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" } ]])
--[[ maps.n["gx"] = { utils.system_open, desc = "Open the file under cursor with system app" } ]]
--[[ maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" } ]]
--[[ maps.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" } ]]
--[[ maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" } ]]
--[[ maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" } ]]
