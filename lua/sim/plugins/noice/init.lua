local editor_name = 'sim'

local user_config = require(string.format('%s.core.user', editor_name))
local u = require(string.format('%s.utils', editor_name))
local map = require(string.format('%s.utils', editor_name)).map

return {
  'folke/noice.nvim',
  config = function()
    local config = u.merge({
      presets = {
        lsp_doc_border = true,
      },
      views = {
        notify = {
          merge = true,
        },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = false,
        },
      },
    }, user_config.plugins.noice or {})

    require('noice').setup(config)

    map('n', '<c-j>', function()
      if not require('noice.lsp').scroll(4) then
        return '<c-j>'
      end
    end)

    map('n', '<c-k>', function()
      if not require('noice.lsp').scroll(-4) then
        return '<c-k>'
      end
    end)
  end,
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
