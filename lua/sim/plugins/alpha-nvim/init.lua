return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('sim.plugins.alpha-nvim.config').setup()
  end,
}
