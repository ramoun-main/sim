local editor_name = 'sim'
local utils = require(string.format('%s.utils', editor_name))
local map = utils.map
local is_available = utils.is_available

-- plugin management (Lazy)
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
  map('n', '<C-h>', function()
    require('smart-splits').move_cursor_left()
  end, { desc = 'Move to Left split' })
  map('n', '<C-j>', function()
    require('smart-splits').move_cursor_down()
  end, { desc = 'Move to below split' })
  map('n', '<C-k>', function()
    require('smart-splits').move_cursor_up()
  end, { desc = 'Move to above split' })
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

-- sidebar
map('n', '<leader>e', ':NvimTreeToggle<CR>') -- toggle file explorer

--
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
map('n', '<leader>fK', '<cmd>Telescope keymaps<cr>', { desc = 'list all Sim keymaps' })

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
map('n', '<leader>fC', function()
  require('telescope.builtin').commands()
end, { desc = 'Find commands' })
--[[ maps.n['<leader>ff'] = { ]]
--[[   function() ]]
--[[     require('telescope.builtin').find_files() ]]
--[[   end, ]]
--[[   desc = 'Find files', ]]
--[[ } ]]
map('n', '<leader>fF', function()
  require('telescope.builtin').find_files({ hidden = true, no_ignore = true })
end, { desc = 'Find all files' })
map('n', '<leader>fH', function()
  require('telescope.builtin').help_tags()
end, { desc = 'Find help' })
--
map('n', '<leader>fa', function()
  require('telescope.builtin').keymaps()
end, { desc = 'Find keymaps' })
map('n', '<leader>fm', function()
  require('telescope.builtin').man_pages()
end, { desc = 'Find man' })
if is_available('nvim-notify') then
  map('n', '<leader>fn', function()
    require('telescope').extensions.notify.notify()
  end, { desc = 'Find notifications' })
end
map('n', '<leader>fo', function()
  require('telescope.builtin').oldfiles()
end, { desc = 'Find history' })
map('n', '<leader>fr', function()
  require('telescope.builtin').registers()
end, { desc = 'Find registers' })
map('n', '<leader>ft', function()
  require('telescope.builtin').colorscheme({ enable_preview = true })
end, { desc = 'Find themes' })
--[[ maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" } ]]
map('n', '<leader>fW', function()
  require('telescope.builtin').live_grep({
    additional_args = function(args)
      return vim.list_extend(args, { '--hidden', '--no-ignore' })
    end,
  })
end, { desc = 'Find words in all files' })

--[[ maps.n["<leader>l"] = sections.l ]]
map('n', '<leader>ls', function()
  local aerial_avail, _ = pcall(require, 'aerial')
  if aerial_avail then
    require('telescope').extensions.aerial.aerial()
  else
    require('telescope.builtin').lsp_document_symbols()
  end
end, { desc = 'Search symbols' })

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
