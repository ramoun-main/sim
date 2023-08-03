local editor_name = 'sim'

local ok, user_config = pcall(require, string.format('%s.config.config', editor_name))

if not ok then
  user_config = {}
end

local default_config = {
  border = 'rounded',
  disable_builtin_plugins = {},
  add_plugins = {
    'fladson/vim-kitty',
    'folke/neodev.nvim', --[[ developing plugins for neovim with lua ]]
    --[[ 'NeogitOrg/neogit' ]]
    'dbmrq/vim-ditto',
    'tpope/vim-capslock',
    'tpope/vim-sleuth',
    'tpope/vim-rhubarb',
    'tpope/vim-haml',
    'tpope/vim-repeat',
    'glts/vim-radical',
    'tpope/vim-endwise',
    'tpope/vim-abolish',
    'tpope/vim-dotenv',
    'dbmrq/vim-dialect',
    'dbmrq/vim-chalk',
    'mfussenegger/nvim-dap',
    'SmiteshP/nvim-navic',
    --[[ 'SmiteshP/nvim-navic', ]]
    --'jesseduffield/lazygit'
    --'dandavison/delta'
    --'sindrets/diffview.nvim'
    --'romgrk/barbar.nvim'
    --'lukas-reineke/indent-blankline.nvim'
    --'williamboman/mason.nvim'
  },
  plugins = {
    lsp_lines = {
      -- additional flag only for CosmicNvim
      -- true - loads plugin and is enabled at start
      -- false - loads plugin but is not enabled at start
      -- you may use <leader>ld to toggle
      enable_on_start = true,
    },
  },
  lsp = {
    format_on_save = true, -- true/false or table of filetypes {'.ts', '.js',}
    format_timeout = 2000,
    rename_notification = true,
    -- table of callbacks pushed via plugins
    on_attach_mappings = {},
    -- lsp servers that should be installed
    ensure_installed = {
      'astro',
      --[[ 'actionlint', ]]
      --[[ 'eslint_d', ]]
      --[[ 'prettierd', ]]
      'gopls',
      'bashls',
      'cssls',
      'graphql',
      'html',
      'jsonls',
      'tsserver',
      'lua_ls',
      'pyright',
      'svelte',
      'tailwindcss',
      'yamlls',
    },
    -- lsp servers that should be enabled
    servers = {
      gopls = true,
      astro = true,
      tailwindcss = true,
      jsonls = {
        format = false,
      },
      pyright = true,
      lua_ls = {
        format = false,
      },
      html = true,
      tsserver = {
        format = true,
      },
    },
  },
}

local u = require(string.format('%s.utils', editor_name))
local config = u.merge(default_config, user_config)

function config.lsp.add_on_attach_mapping(callback)
  table.insert(config.lsp.on_attach_mappings, callback)
end

return config
