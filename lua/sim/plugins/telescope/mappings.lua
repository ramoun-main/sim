local editor_name = 'sim'

local map = require(string.format('%s.utils', editor_name)).map
local utils = require(string.format('%s.utils', editor_name))
local is_available = utils.is_available

-- f - Key

map('n', '<leader>f<CR>', '<cmd>Telescope resume<cr>', { desc = 'Resume Prev' })
--find files within current working directory, respects .gitignore
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find File' })
map(
  'n',
  '<leader>fF',
  "<cmd>lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true })<CR>",
  { desc = 'Find (All Files)' }
)

map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find Buffer' })
map('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Grep Current String' })
map('n', '<leader>fC', '<cmd>Telescope commands<cr>', { desc = 'Find Commands' })
map('n', '<leader>fh', '<cmd>Telescope oldfiles<cr>', { desc = 'Find History' })
map('n', '<leader>fH', '<cmd>Telescope help_tags<cr>', { desc = 'Find Tags' })
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Find Keymaps' })
map('n', '<leader>fm', '<cmd>Telescope man_pages<cr>', { desc = 'Find ManPages' })
if is_available('nvim-notify') then
  map('n', '<leader>fn', function()
    require('telescope').extensions.notify.notify()
  end, { desc = 'Find Notifications' })
end
map(
  'n',
  '<leader>ft',
  "<cmd>lua require('telescope.builtin').colorscheme({ enable_preview = true })<CR>",
  { desc = 'Find themes' }
)
map('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find String' })
map('n', '<leader>fS', function()
  local aerial_avail, _ = pcall(require, 'aerial')
  if aerial_avail then
    require('telescope').extensions.aerial.aerial()
  else
    require('telescope.builtin').lsp_document_symbols()
  end
end, { desc = 'Search Symbols' })
map('n', '<leader>fw', function()
  require('telescope.builtin').live_grep({
    additional_args = function(args)
      return vim.list_extend(args, { '--hidden', '--no-ignore' })
    end,
  })
end, { desc = 'Find Word (All Files)' })
map('n', '<leader>f"', '<cmd>Telescope registers<cr>', { desc = 'Find registers' })
map('n', "<leader>f'", '<cmd>Telescope marks<cr>', { desc = 'Find Marks' })

-- g - Key
