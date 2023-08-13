local map = require(string.format('%s.utils', EditorName)).map

-- session
map('n', '<leader>Sl', '<cmd>silent RestoreSession<cr>', { desc = 'Restore session' })
map('n', '<leader>Ss', '<cmd>SaveSession<cr>', { desc = 'Save session' })
map(
  'n',
  '<leader>Si',
  string.format(
    '<cmd>lua require("%s.utils.logger"):log("Session name: " .. require("auto-session-library").current_session_name())<cr>',
    EditorName
  ),
  { desc = 'Print session' }
)
