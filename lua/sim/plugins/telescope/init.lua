local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
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
    -- normal mappings
    local u = require(string.format('%s.utils', editor_name))
    local map = u.map

    map('n', '<leader>ff', '', {
      callback = require(string.format('%s.plugins.telescope.utils', editor_name)).project_files,
      desc = 'Find file',
    })
    map('n', '<leader>fp', ':Telescope find_files<cr>', { desc = 'Find project file' })
    map('n', '<leader>fk', ':Telescope buffers<cr>', { desc = 'Find buffer' })
    map('n', '<leader>fs', ':Telescope live_grep<cr>', { desc = 'Grep string' })
    map('n', '<leader>fw', ':Telescope grep_string<cr>', { desc = 'Grep current word' })

    -- git navigation
    map('n', '<leader>vc', ':Telescope git_commits<cr>', { desc = 'Git commits' })
    map('n', '<leader>vg', ':Telescope git_status<cr>', { desc = 'Git status' })

    user_config.lsp.add_on_attach_mapping(function(client, bufnr)
      local buf_map = u.create_buf_map(bufnr)

      buf_map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { desc = 'Go to definition' })
      buf_map('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { desc = 'Go to implementation' })
      buf_map('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', { desc = 'Go to type definition' })
      buf_map('n', 'gr', '<cmd>Telescope lsp_references<cr>', { desc = 'Go to reference' })

      buf_map('n', '<leader>ldb', '<cmd>Telescope diagnostics bufnr=0<cr>', { desc = 'Show buffer diagnostics' })
      buf_map('n', '<leader>ldw', '<cmd>Telescope diagnostics<cr>', { desc = 'Workspace diagnostics' })
    end)
  end,
  cmd = { 'Telescope' },
  keys = {
    {
      '<leader>ff',
      string.format('<cmd>lua require("%s.plugins.telescope.utils").project_files()<cr>', editor_name),
      desc = 'Find project file',
    },
  },
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'telescope'),
}
