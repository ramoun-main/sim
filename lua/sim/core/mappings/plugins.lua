local editor_name = 'sim'
local utils = require(string.format('%s.utils', editor_name))
local map = utils.map
local is_available = utils.is_available

map('n', '<leader>p/', '<cmd>:Lazy<cr>')
map('n', '<leader>pc', ':Lazy check<cr>', { desc = 'Check Plugins' })
map('n', '<leader>pu', ':Lazy update<cr>', { desc = 'Update Plugins' })
map('n', '<leader>ps', ':Lazy show<cr>', { desc = 'Show Plugins' })
map('n', '<leader>ph', ':Lazy help<cr>', { desc = 'Help' })
map('n', '<leader>pp', ':Lazy profile<cr>', { desc = 'Profile' })
map('n', '<leader>pl', ':Lazy logs<cr>', { desc = 'Logs' })
map('n', '<leader>px', ':Lazy clear<cr>', { desc = 'Clear Uninstalled Plugins' })
map('n', '<leader>pr', ':Lazy restore<cr>', { desc = 'Restore Plugins From Lockfile' })
if is_available('mason.nvim') then
  map('n', '<leader>pm', '<cmd>Mason<cr>', { desc = 'Mason Installer' })
  map('n', '<leader>pM', '<cmd>MasonUpdateAll<cr>', { desc = 'Mason Update' })
end

if is_available('smart-splits.nvim') then
  --[[ map('n', '<C-h>', function() ]]
  --[[   require('smart-splits').move_cursor_left() ]]
  --[[ end, { desc = 'Move to Left split' }) ]]
  --[[ map('n', '<C-j>', function() ]]
  --[[   require('smart-splits').move_cursor_down() ]]
  --[[ end, { desc = 'Move to below split' }) ]]
  --[[ map('n', '<C-k>', function() ]]
  --[[   require('smart-splits').move_cursor_up() ]]
  --[[ end, { desc = 'Move to above split' }) ]]
  --[[ map('n', '<C-l>', function() ]]
  --[[   require('smart-splits').move_cursor_right() ]]
  --[[ end, { desc = 'Move to right split' }) ]]
  map('n', '<C-Up>', function()
    require('smart-splits').resize_up()
  end, { desc = 'Resize split up' })
  map('n', '<C-Down>', function()
    require('smart-splits').resize_down()
  end, { desc = 'Resize split down' })
  map('n', '<C-Left>', function()
    require('smart-splits').resize_left()
  end, { desc = 'Resize split left' })
  map('n', '<C-Right>', function()
    require('smart-splits').resize_right()
  end, { desc = 'Resize split right' })
else
  map('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
  map('n', '<C-j>', '<C-w>j', { desc = 'Move to below split' })
  map('n', '<C-k>', '<C-w>k', { desc = 'Move to above split' })
  map('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })
  map('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Resize split up' })
  map('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Resize split down' })
  map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Resize split left' })
  map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Resize split right' })
end

-- GitSigns
if is_available('gitsigns.nvim') then
  --[[ map('n', '<leader>g', { desc = 'git' }) ]]
  map('n', '<leader>g]', function()
    require('gitsigns').next_hunk()
  end, { desc = 'Next Git hunk' })
  map('n', '<leader>g[', function()
    require('gitsigns').prev_hunk()
  end, { desc = 'Previous Git hunk' })
  map('n', '<leader>gl', function()
    require('gitsigns').blame_line()
  end, { desc = 'View Git blame' })
  map('n', '<leader>gL', function()
    require('gitsigns').blame_line({ full = true })
  end, { desc = 'View full Git blame' })
  map('n', '<leader>gp', function()
    require('gitsigns').preview_hunk()
  end, { desc = 'Preview Git hunk' })
  map('n', '<leader>gh', function()
    require('gitsigns').reset_hunk()
  end, { desc = 'Reset Git hunk' })
  map('n', '<leader>gr', function()
    require('gitsigns').reset_buffer()
  end, { desc = 'Reset Git buffer' })
  map('n', '<leader>ga', function()
    require('gitsigns').stage_hunk()
  end, { desc = 'Stage Git hunk' })
  map('n', '<leader>gS', function()
    require('gitsigns').stage_buffer()
  end, { desc = 'Stage Git buffer' })
  map('n', '<leader>gu', function()
    require('gitsigns').undo_stage_hunk()
  end, { desc = 'Unstage Git hunk' })
  map('n', '<leader>gd', function()
    require('gitsigns').diffthis()
  end, { desc = 'View Git diff' })
end

-- Improved Code Folding
if is_available('nvim-ufo') then
  map('n', 'zR', function()
    require('ufo').openAllFolds()
  end, { desc = 'Open all folds' })
  map('n', 'zM', function()
    require('ufo').closeAllFolds()
  end, { desc = 'Close all folds' })
  map('n', 'zr', function()
    require('ufo').openFoldsExceptKinds()
  end, { desc = 'Fold less' })
  map('n', 'zm', function()
    require('ufo').closeFoldsWith()
  end, { desc = 'Fold more' })
  map('n', 'zp', function()
    require('ufo').peekFoldedLinesUnderCursor()
  end, { desc = 'Peek fold' })
end

-- restart lsp server (not on youtube nvim video)
map('n', '<leader>rs', ':LspRestart<CR>', { desc = 'mapping to restart lsp if necessary' })

-- Comment : -- TODO : is it Comment or Comments
if is_available('Comment.nvim') then
  map('n', '<leader>/', function()
    require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
  end, { desc = 'Toggle Line Comment' })
  map(
    'v',
    '<leader>/',
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = 'Toggle comment for selection' }
  )
end

map('n', '<C-y>;', 'C-Y,', { desc = 'Expand' })
