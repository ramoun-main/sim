return {
  'zbirenbaum/copilot.lua',
  lazy = false,
  opts = function()
    return require('sim.plugins.copilot.options')
  end,
  config = function(_, opts)
    require('copilot').setup(opts)
  end,
}
