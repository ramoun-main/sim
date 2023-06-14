local map = require('cosmic.utils').map
local utils = require('cosmic.utils')
local is_available = utils.is_available

--[[ local maps = { i = {}, n = {}, v = {}, t = {} } ]]

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
if is_available('mason.nvim') then
  map('n', '<leader>pm', '<cmd>Mason<cr>', { desc = 'Mason Installer' })
  map('n', '<leader>pM', '<cmd>MasonUpdateAll<cr>', { desc = 'Mason Update' })
end

-- resize with arrows
map('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize -2' })
map('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize +2' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Vertical Resize -2' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Vertical Resize +2' })

-- my custom remaps (entrirely)

-- use jj/jk to exit insert mode
map('i', 'jj', '<ESC>')
map('i', 'jk', '<ESC>')

--[[ map('i', '<C-j>', '<C-e') ]]
--[[ map('i', '<C-k>', '<C-y>') ]]

-- switch gM and gm
map('n', 'gM', 'gm')
map('n', 'gm', 'gM')

-- clear search highlights
map('n', '<leader>nh', ':nohl<CR>')

-- delete single character without copying into register
map('n', 'x', '"_x')

-- increment/decrement numbers
map('n', '<leader>+', '<C-a>') -- increment
map('n', '<leader>-', '<C-x>') -- decrement

-- tab management
map('n', '<leader>to', ':tabnew<CR>', { desc = 'open new tab' })
map('n', '<leader>tx', ':tabclose<CR>', { desc = 'close currentab' })
--[[ map('n', '<leader>tn', ':tabn<CR>', { desc = 'go to next tab tab' }) ]]
map('n', 'L', ':tabn<CR>', { desc = 'go to next tab tab' })
--[[ map('n', '<leader>tp', ':tabp<CR>', { desc = 'go to previous tab' }) ]]
map('n', 'H', ':tabp<CR>', { desc = 'go to previous tab' })

-- sidebar

map('n', '<leader>e', ':NvimTreeToggle<CR>') -- toggle file explorer

if is_available('smart-splits.nvim') then
  map('n', '<C-h>', function()
    require('smart-splits').move_cursor_left()
  end, { desc = 'Move to Left split' })
  --[[ map('n', '<C-j>', function() ]]
  --[[   require('smart-splits').move_cursor_down() ]]
  --[[ end, { desc = 'Move to below split' }) ]]
  --[[ map('n', '<C-k>', function() ]]
  --[[   require('smart-splits').move_cursor_up() ]]
  --[[ end, { desc = 'Move to above split' }) ]]
  map('n', '<C-l>', function()
    require('smart-splits').move_cursor_right()
  end, { desc = 'Move to right split' })
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

-- splits
map('n', '<leader>sv', '<C-w>v') -- split window vertically
map('n', '<leader>sh', '<C-w>s') -- split window horizontally
map('n', '<leader>sx', ':close<CR>') -- close current split window
--
-- vim-maximizer
map('n', '<leader>ie', '<C-w>=', { desc = 'make split windows equal width & height' })
map('n', '<leader>w', '<C-w>q', { desc = 'Close a Split' })
map('n', '\\', '<cmd>vsplit<cr>', { desc = 'Vertical Split' })
map('n', '|', '<cmd>split<cr>', { desc = 'Horizontal Split' })

-- telescope (IDE Search)
-- telescope
map(
  'n',
  '<leader>ff',
  '<cmd>Telescope find_files<cr>',
  { desc = 'find files within current working directory, respects .gitignore' }
)
map(
  'n',
  '<leader>fc',
  '<cmd>Telescope grep_string<cr>',
  { desc = 'find string under cursor in current working directory' }
)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'list open buffers in current neovim instance' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'list available help tags' })

-- telescope git commands
map(
  'n',
  '<leader>gc',
  '<cmd>Telescope git_commits<cr>',
  { desc = 'list all git commits (use <cr> to checkout) ["gc" for git commits]' }
)
map(
  'n',
  '<leader>gfc',
  '<cmd>Telescope git_bcommits<cr>',
  { desc = 'list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]' }
)
map(
  'n',
  '<leader>gb',
  '<cmd>Telescope git_branches<cr>',
  { desc = 'list git branches (use <cr> to checkout) ["gb" for git branch]' }
)
map(
  'n',
  '<leader>gs',
  '<cmd>Telescope git_status<cr>',
  { desc = 'list current changes per file with diff preview ["gs" for git status]' }
)

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

-- find
-- if is_available('telescope.nvim') then
--[[ maps.n["<leader>f"] = sections.f ]]
--[[ maps.n["<leader>g"] = sections.g ]]
--[[ maps.n["<leader>gb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" } ]]
--[[ maps.n["<leader>gc"] = { function() require("telescope.builtin").git_commits() end, desc = "Git commits" } ]]
--[[ maps.n["<leader>gt"] = { function() require("telescope.builtin").git_status() end, desc = "Git status" } ]]
map('n', '<leader>f<CR>', function()
  require('telescope.builtin').resume()
end, { desc = 'Resume previous search' })
map('n', "<leader>f'", function()
  require('telescope.builtin').marks()
end, { desc = 'Find marks' })
--[[ map('<leader>fa', function() ]]
--[[   local cwd = vim.fn.stdpath('config') .. '/..' ]]
--[[   local search_dirs = {} ]]
--[[   for _, dir in ipairs(astronvim.supported_configs) do -- search all supported config locations ]]
--[[     if dir == astronvim.install.home then ]]
--[[       dir = dir .. '/lua/user' ]]
--[[     end -- don't search the astronvim core files ]]
--[[     if vim.fn.isdirectory(dir) == 1 then ]]
--[[       table.insert(search_dirs, dir) ]]
--[[     end -- add directory to search if exists ]]
--[[   end ]]
--[[   if vim.tbl_isempty(search_dirs) then -- if no config folders found, show warning ]]
--[[     utils.notify('No user configuration files found', vim.log.levels.WARN) ]]
--[[   else ]]
--[[     if #search_dirs == 1 then ]]
--[[       cwd = search_dirs[1] ]]
--[[     end -- if only one directory, focus cwd ]]
--[[     require('telescope.builtin').find_files({ ]]
--[[       prompt_title = 'Config Files', ]]
--[[       search_dirs = search_dirs, ]]
--[[       cwd = cwd, ]]
--[[     }) -- call telescope ]]
--[[   end ]]
--[[ end, { desc = 'Find AstroNvim config files' }) ]]
map('n', '<leader>fb', function()
  require('telescope.builtin').buffers()
end, { desc = 'Find buffers' })
map('n', '<leader>fc', function()
  require('telescope.builtin').grep_string()
end, { desc = 'Find for word under cursor' })
--[[ maps.n['<leader>fC'] = { ]]
--[[   function() ]]
--[[     require('telescope.builtin').commands() ]]
--[[   end, ]]
--[[   desc = 'Find commands', ]]
--[[ } ]]
--[[ maps.n['<leader>ff'] = { ]]
--[[   function() ]]
--[[     require('telescope.builtin').find_files() ]]
--[[   end, ]]
--[[   desc = 'Find files', ]]
--[[ } ]]
--[[ maps.n['<leader>fF'] = { ]]
--[[   function() ]]
--[[     require('telescope.builtin').find_files({ hidden = true, no_ignore = true }) ]]
--[[   end, ]]
--[[   desc = 'Find all files', ]]
--[[ } ]]
map('n', '<leader>fH', function()
  require('telescope.builtin').help_tags()
end, { desc = 'Find help' })
--
--[[ map('n', '<leader>fa', function() ]]
--[[   require('telescope.builtin').keymaps() ]]
--[[ end, { desc = 'Find keymaps' }) ]]
--[[ map('n', '<leader>fm', function() ]]
--[[   require('telescope.builtin').man_pages() ]]
--[[ end, { desc = 'Find man' }) ]]
--[[ if is_available('nvim-notify') then ]]
--[[   map('n', '<leader>fn', function() ]]
--[[     require('telescope').extensions.notify.notify() ]]
--[[   end, { desc = 'Find notifications' }) ]]
--[[ end ]]
--[[ map('n', '<leader>fo', function() ]]
--[[   require('telescope.builtin').oldfiles() ]]
--[[ end, { desc = 'Find history' }) ]]
--[[ map('n', '<leader>fr', function() ]]
--[[   require('telescope.builtin').registers() ]]
--[[ end, { desc = 'Find registers' }) ]]
--[[ map('n', '<leader>ft', function() ]]
--[[   require('telescope.builtin').colorscheme({ enable_preview = true }) ]]
--[[ end, { desc = 'Find themes' }) ]]
--
--[[ maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" } ]]

--[[ map('n', '<leader>fW', function() ]]
--[[   require('telescope.builtin').live_grep({ ]]
--[[     additional_args = function(args) ]]
--[[       return vim.list_extend(args, { '--hidden', '--no-ignore' }) ]]
--[[     end, ]]
--[[   }) ]]
--[[ end, { desc = 'Find words in all files' }) ]]

--[[ maps.n["<leader>l"] = sections.l ]]
--[[ maps.n["<leader>ls"] = { ]]
--[[   function() ]]
--[[     local aerial_avail, _ = pcall(require, "aerial") ]]
--[[     if aerial_avail then ]]
--[[       require("telescope").extensions.aerial.aerial() ]]
--[[     else ]]
--[[       require("telescope.builtin").lsp_document_symbols() ]]
--[[     end ]]
--[[   end, ]]
--[[   desc = "Search symbols", ]]
--[[ } ]]
-- end

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

-- Stay in indent mode
map('v', '<S-Tab>', '<gv', { desc = 'Unindent line' })
map('v', '<Tab>', '>gv', { desc = 'Indent line' })

-- restart lsp server (not on youtube nvim video)
map('n', '<leader>rs', ':LspRestart<CR>', { desc = 'mapping to restart lsp if necessary' })

-- line manip.
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'move a block of text down by one line.' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'move a block of text up by two lines' })
map('n', 'J', 'mzJ`z', { desc = 'join current line and line below it' })
map('n', '<C-d>', '<C-d>zz', {
  desc = 'scrolls the window down by half of its height and then centers the line containing the cursor in the middle of the window',
})
map('n', '<C-u>', '<C-u>zz', {
  desc = 'scrolls the window up by half of its height and then centers the line containing the cursor in the middle of the window.',
})
map('n', 'n', 'nzzzv', {
  desc = 'repeats the search forward, centers the line containing the cursor, and adjusts the viewable area to show more lines above the cursor',
})
map('n', 'N', 'Nzzzv', {
  desc = 'repeats the search backward, centers the line containing the cursor, and adjusts the viewable area to show more lines above the cursor',
})
map('v', '<leader>p', [["_dP]], { desc = 'delete the selected text and paste it above the current line' })

-- yank to system clipboard
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
map('n', '<leader>F', vim.lsp.buf.format, { desc = 'formatting the current buffer' })
map('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'moves the cursor to the next location in the quickfix list' })
map('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'moves the cursor to the prev location in the quickfix list' })
map('n', '<leader>k', '<cmd>lnext<CR>zz', {
  desc = 'moves the cursor to the next location in the location list and then centers the line containing the cursor in the middle of the window.',
})
map('n', '<leader>j', '<cmd>lprev<CR>zz', {
  desc = 'moves the cursor to the prev location in the location list and then centers the line containing the cursor in the middle of the window.',
})
map('n', '<leader>fS', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = 'performs a case-insensitive search and replace operation in the entire file. The word under the cursor is used as the replacement for each occurrence of the matched word',
})
map('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'makes the current file executable' })

-- Comment : --TODO: is it Comment or Comments
if is_available('Comment.nvim') then
  map('n', '<leader>/', function()
    require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
  end, { desc = 'Toggle comment line' })
  map(
    'v',
    '<leader>/',
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = 'Toggle comment for selection' }
  )
end

--
-- FILE
map('n', '<leader>ss', '<cmd>w<cr>', { desc = 'Save' })
map('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Quit' })
map('n', '<leader>n', '<cmd>enew<cr>', { desc = 'New File' })
map('n', '<C-s>', '<cmd>w!<cr>', { desc = 'Force write' })
map('n', '<C-q>', 'cmd>q!<cr>', { desc = 'Force quit' })

-- NOP!!!
--
-- vim.keymap.set("n", "Q", "<nop>", {desc='"no operation." It essentially disables the mapping and makes the key sequence do nothing'})
-- vim.keymap.set("n", "<Left>", "<nop>")
-- vim.keymap.set("n", "<Right>", "<nop>")
-- vim.keymap.set("n", "<Up>", "<nop>")
