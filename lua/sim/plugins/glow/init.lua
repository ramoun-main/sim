local editor_name = 'sim'

return {
  'ellisonleao/glow.nvim',
  event = 'VimEnter',
  init = function()
    require(string.format('%s.plugins.glow.mappings', editor_name))
  end,
  config = function()
    require('glow').setup({
      style = 'dark',
      width = 120,
    })
  end,
  cmd = 'Glow',
}
