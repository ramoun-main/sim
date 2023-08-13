local user_config = require(string.format('%s.core.user', EditorName))
local utils = require(string.format('%s.utils', EditorName))
return function()
  user_config.lsp.add_on_attach_mapping(function(client, bufnr)
    local buf_map = utils.create_buf_map(bufnr)

    buf_map('n', 'gn', '<cmd>lua require("cosmic-ui").rename()<cr>', { desc = 'Rename' })
    buf_map('n', '<leader>la', '<cmd>lua require("cosmic-ui").code_actions()<cr>', { desc = 'Code Actions' })
    buf_map(
      'v',
      '<leader>la',
      '<cmd>lua require("cosmic-ui").range_code_actions()<cr>',
      { desc = 'Range Code Actions' }
    )
  end)
end
