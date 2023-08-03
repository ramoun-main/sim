local editor_name = 'sim'

local modules = {
  -- keep this order as it is or the mappings will be broken
  string.format('%s.core.options', editor_name),
  string.format('%s.core.plugins', editor_name),
  string.format('%s.core.commands', editor_name),

  string.format('%s.lsp', editor_name),

  string.format('%s.config.editor', editor_name),

  -- load mappings only after editor configs are loaded (that's why down in the loop we use ipairs)
  string.format('%s.core.mappings', editor_name),
}

-- importing all modules needed
for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  -- editor config files may or may not be present but all other modules must be there
  if not ok and not mod:find(string.format('%s.config', editor_name)) then
    error(string.format('Error loading %s...\n\n%s', mod, err))
  end
end
