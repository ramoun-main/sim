package.path = package.path .. '../../../editor-name.lua'
local editor_name = require('editor-name')

local augroup_name = editor_name
local group = vim.api.nvim_create_augroup(augroup_name .. 'Editor', { clear = true })

-- make tabs equal on window resize
vim.api.nvim_create_autocmd('VimResized', {
  command = 'tabdo wincmd =',
  group = group,
})

vim.cmd(string.format(
  [[
  command! UpdateEditor lua require('%s.utils.update').update()
]],
  editor_name
))
