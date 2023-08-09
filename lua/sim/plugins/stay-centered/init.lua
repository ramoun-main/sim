return {
  'arnamak/stay-centered.nvim',
  event = 'BufEnter',
  config = function()
    require('stay-centered').setup()
  end,
}
