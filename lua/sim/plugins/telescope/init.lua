local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
local u = require(string.format('%s.utils', editor_name))

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    -- this is required for ripgrep to work
    -- TODO: currently we use sudo apt install ripgrep to make it work but i am sure there is a thing that can make install automatically on any system
    'BurntSushi/ripgrep',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  config = function()
    require(string.format('%s.plugins.telescope.config', editor_name))
  end,
  init = function()
    require(string.format('%s.plugins.telescope.mappings', editor_name))
    -- git navigation
    user_config.lsp.add_on_attach_mapping(function(_client, bufnr)
      local buf_map = u.create_buf_map(bufnr)

      buf_map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { desc = 'Go to definition' })
      buf_map('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { desc = 'Go to implementation' })
      buf_map('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', { desc = 'Go to type definition' })
      buf_map('n', 'gr', '<cmd>Telescope lsp_references<cr>', { desc = 'Go to reference' })
      --[[ buf_map('n', 'gp', "<cmd>lua require('plugins.telescope.pickers.multi-rg')()<CR>") ]]

      -- list git branches (use <cr> to checkout) ["gb" for git branch]
      buf_map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = 'Git Branch' })
      -- list current changes per file with diff preview ["gs" for git status]
      buf_map('n', '<leader>gc', ':Telescope git_commits<cr>', { desc = 'Git Commits' })
      -- list current changes per file with diff preview ["gs" for git status]
      buf_map('n', '<leader>gs', ':Telescope git_status<cr>', { desc = 'Git Status' })

      buf_map('n', '<leader>ldb', '<cmd>Telescope diagnostics bufnr=0<cr>', { desc = 'Show buffer diagnostics' })
      buf_map('n', '<leader>ldw', '<cmd>Telescope diagnostics<cr>', { desc = 'Workspace diagnostics' })
    end)
  end,
  cmd = { 'Telescope' },
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'telescope'),
}
