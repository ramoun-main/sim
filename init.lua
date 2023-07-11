-- get editor name
local editor_name = require('editor-name')

-- check if vim version is capable of running the Sim Editor
if vim.fn.has('nvim-0.8') == 0 then
  error(string.format('Need Neovim v0.8+ in order to run %s', editor_name))
end

-- import name of editor
local ok, err = pcall(require, editor_name)

if not ok then
  error(('Error loading core...\n\n%s'):format(err))
end
