local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
local u = require(string.format('%s.utils', editor_name))

return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local defaults = require(string.format('%s.lsp.providers.defaults', editor_name))
    local null_ls = require('null-ls')
    local config_opts = u.merge(user_config.lsp.servers.null_ls or {}, {
      default_cosmic_sources = true,
    })
    if config_opts.default_cosmic_sources then
      local function get_user_config_sources()
        if not config_opts.add_sources then
          return {}
        end

        return config_opts.add_sources()
      end

      config_opts.sources = u.merge_list({
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.prettierd.with({
          env = {
            PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
          },
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.gitsigns,
      }, get_user_config_sources())
    end

    null_ls.setup(u.merge(defaults, config_opts))
  end,
  event = 'VeryLazy',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'null_ls'),
}
