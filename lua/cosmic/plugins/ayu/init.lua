local user_config = require('cosmic.core.user')
return {
  { -- color scheme
    'Shatur/neovim-ayu',
    lazy = false,
    config = function()
      vim.cmd('color ayu')
    end,
    enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'ayu'),
  },
}
