local editor_name = 'sim'

local utils = require(string.format('%s.utils', editor_name))
local lsp_utils = require(string.format('%s.utils.lsp', editor_name))
local M = {}

-- Mappings.
function M.init(client, bufnr)
  local buf_map = utils.create_buf_map(bufnr, {
    noremap = false,
  })

  buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'Go to definition' })
  buf_map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = 'Go to declaration' })
  buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = 'Go to implementation' })
  buf_map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = 'Go to type definition' })
  buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'Go to reference' })

  buf_map('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { desc = 'Prev diagnostic' })
  buf_map(
    'n',
    ']g',
    "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>",
    { desc = 'Next diagnostic' }
  )
  buf_map(
    'n',
    'ge',
    '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>',
    { desc = 'Show current line diagnostic' }
  )
  buf_map(
    'n',
    '<leader>ldb',
    '<cmd>lua vim.diagnostic.open_float(nil, { scope = "buffer", })<cr>',
    { desc = 'Show buffer diagnostics' }
  )

  -- hover
  buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Show documentation' })

  -- code actions (diagnostics)
  buf_map('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename' })
  buf_map('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_actions()<cr>', { desc = 'Code Actions' })
  buf_map('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code Action' })
  --[[ buf_map('v', '<leader>la', "<cmd>'<,'>lua vim.lsp.buf.code_action()<cr>", buf_({ desc = 'Code Actions' })) ]]
  buf_map('v', '<leader>lc', '<cmd>lua vim.lsp.buf.range_code_actions()<cr>', { desc = 'Range Code Actions' })

  -- formatting
  buf_map('n', '<leader>lf', '', { desc = 'Format', callback = lsp_utils.format })
  --[[ buf_map('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { desc = '' }) ]]
  buf_map('v', '<leader>lf', '<cmd>lua vim.lsp.buf.range_formatting()<cr>', { desc = 'Range Format' })

  -- lsp workspace
  buf_map('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', { desc = 'Add workspace folder' })
  buf_map('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', {
    desc = 'Remove workspace folder',
  })
  buf_map(
    'n',
    '<leader>lwl',
    string.format(
      '<cmd>lua require("%s.utils.logger"):log(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      editor_name
    ),
    { desc = 'Show workspace folders' }
  )
end

return M
