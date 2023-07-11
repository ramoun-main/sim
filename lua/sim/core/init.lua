package.path = package.path .. ';../../../editor-name.lua'
local editor_name = require('editor-name')

local modules = {
  string.format('%s.core.editor', editor_name),
  string.format('%s.core.pluginsInit', editor_name),
  string.format('%s.core.commands', editor_name),

  string.format('%s.lsp', editor_name),

  string.format('%s.config.editor', editor_name),

  -- load mappings only after editor configs are loaded (that's why down in the loop we use ipairs)
  string.format('%s.core.mappings', editor_name),
}

-- set up lazy.nvim to install plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- importing all modules needed
for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  -- editor config files may or may not be present but all other modules must be there
  if not ok and not mod:find(string.format('%s.config', editor_name)) then
    error(string.format('Error loading %s...\n\n%s', mod, err))
  end
end
