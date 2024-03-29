--[[ local editor_name = 'sim' ]]
--[[]]
--[[ local user_config = require(string.format('%s.core.user', editor_name)) ]]
--[[ local u = require(string.format('%s.utils', editor_name)) ]]
--[[]]
--[[ return { ]]
--[[   'Exafunction/codeium.vim', ]]
--[[   init = function() ]]
--[[     user_config.lsp.add_on_attach_mapping(function(_client, bufnr) ]]
--[[       local buf_map = u.create_buf_map(bufnr) ]]
--[[]]
--[[       buf_map('n', '<leader>aca', '<cmd>Codeium Auth<cr>', { desc = 'Codeium Auth' }) ]]
--[[       buf_map('n', '<leader>ace', '<cmd>Codeium Enable<cr>', { desc = 'Codeium Enable' }) ]]
--[[       buf_map('n', '<leader>acd', '<cmd>Codeium Disable<cr>', { desc = 'Codeium Disable' }) ]]
--[[       buf_map('n', '<leader>acbe', '<cmd>Codeium EnableBuffer<cr>', { desc = 'Codeium Buffer Enable' }) ]]
--[[       buf_map('n', '<leader>acbd', '<cmd>Codeium DisableBuffer<cr>', { desc = 'Codeium Buffer Disable' }) ]]
--[[     end) ]]
--[[   end, ]]
--[[   config = function() ]]
--[[     require(string.format('%s.plugins.codeium.mappings', editor_name)) ]]
--[[   end, ]]
--[[   cmd = { 'Codeium' }, ]]
--[[   enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'codeium'), ]]
--[[ } ]]
return {}
