package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

return {
  'williamboman/mason-lspconfig.nvim',
  config = function()
    local user_config = require(string.format('%s.core.user', editor_name))
    require('mason').setup({
      ui = {
        border = user_config.border,
      },
    })
    require('mason-lspconfig').setup({
      ensure_installed = user_config.lsp.ensure_installed,
    })

    -- set up lsp servers
    local u = require(string.format('%s.utils', editor_name))
    local default_config = require(string.format('%s.lsp.providers.defaults', editor_name))
    local lspconfig = require('lspconfig')

    local start_server = function(server)
      -- null_ls doesn't need/can't to be started via lspconfig
      if server == 'null_ls' then
        return
      end

      local opts = default_config

      -- set up default editor options
      if server == 'tsserver' then
        opts = u.merge(opts, require(string.format('%s.lsp.providers.tsserver', editor_name)))
      elseif server == 'jsonls' then
        opts = u.merge(opts, require(string.format('%s.lsp.providers.jsonls', editor_name)))
      elseif server == 'pyright' then
        opts = u.merge(opts, require(string.format('%s.lsp.providers.pyright', editor_name)))
      elseif server == 'lua_ls' then
        opts = u.merge(opts, require(string.format('%s.lsp.providers.lua_ls', editor_name)))
      end

      -- override options if user definds them
      if type(user_config.lsp.servers[server]) == 'table' then
        if user_config.lsp.servers[server].opts ~= nil then
          opts = u.merge(opts, user_config.lsp.servers[server].opts)
        end
      end

      lspconfig[server].setup(opts)
    end

    for config_server, config_opt in pairs(user_config.lsp.servers) do
      if not config_opt == false then
        start_server(config_server)
      end
    end
  end,
  dependencies = {
    'williamboman/mason.nvim',
  },
  event = 'BufEnter',
}
