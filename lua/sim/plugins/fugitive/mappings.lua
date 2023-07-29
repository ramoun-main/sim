local editor_name = 'sim'

local map = require(string.format('%s.utils', editor_name)).map

-- session
map('n', '<leader>ggb', '<cmd>Git blame<cr>', { desc = 'Git Blame' })
map('n', '<leader>ggl', '<cmd>Git log<cr>', { desc = 'Git Log' })
map('n', '<leader>gglo', '<cmd>Git log --oneline<cr>', { desc = 'Git Log OneLins' })
--[[ map( ]]
--[[   'n', ]]
--[[   '<leader>Si', ]]
--[[   string.format( ]]
--[[     '<cmd>lua require("%s.utils.logger"):log("Session name: " .. require("auto-session-library").current_session_name())<cr>', ]]
--[[     editor_name ]]
--[[   ), ]]
--[[   { desc = 'Print session' } ]]
--[[ ) ]]
