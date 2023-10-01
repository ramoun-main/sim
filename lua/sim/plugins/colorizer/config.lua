local map = require(string.format('%s.utils', EditorName)).map

--[[ local defaults = { ]]
-- RRGGBBAA = true, -- #RRGGBBAA hex codes
-- rgb_fn = true, -- CSS rgb() and rgba() functions
-- hsl_fn = true, -- CSS hsl() and hsla() functions
-- css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
-- css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
--[[ } ]]

return function()
  vim.cmd('ColorizerToggle')
  require('colorizer').setup(nil, { css = true })
  vim.cmd(':ColorizerAttachToBuffer')
  map('n', '<leader>ct', ':ColorizerToggle<CR>')
end
