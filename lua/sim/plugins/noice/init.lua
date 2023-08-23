local user_config = require(string.format('%s.core.user', EditorName))
local u = require(string.format('%s.utils', EditorName))
local map = require(string.format('%s.utils', EditorName)).map

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

    map('n', '<c-J>', function()
      if not require('noice.lsp').scroll(4) then
        return '<c-J>'
      end
    end)

    map('n', '<c-K>', function()
      if not require('noice.lsp').scroll(-4) then
        return '<c-K>'
      end
    end)
  end,
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
