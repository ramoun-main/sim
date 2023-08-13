EditorName = 'sim'

-- check if vim version is capable of running the Sim Editor
if vim.fn.has('nvim-0.8') == 0 then
  error(string.format('Need Neovim v0.8+ in order to run %s', EditorName))
end

-- load the editor
local ok, err = pcall(require, EditorName)

if not ok then
  error(('Error loading core...\n\n%s'):format(err))
end
