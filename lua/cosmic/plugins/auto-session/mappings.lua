local map = require('cosmic.utils').map

-- session
map('n', '<leader>Sl', '<cmd>silent RestoreSession<cr>', { desc = 'Restore session' })
map('n', '<leader>Ss', '<cmd>SaveSession<cr>', { desc = 'Save session' })
map(
  'n',
  '<leader>Si',
  '<cmd>lua require("cosmic.utils.logger"):log("Session name: " .. require("auto-session-library").current_session_name())<cr>',
  { desc = 'Print session' }
)
