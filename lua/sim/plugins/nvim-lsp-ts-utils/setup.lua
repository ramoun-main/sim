local editor_name = 'sim'

local u = require(string.format('%s.utils', editor_name))
local config = require(string.format('%s.core.user', editor_name))
local M = {}

M.setup = function(client)
  local ts_utils = require('nvim-lsp-ts-utils')

  ts_utils.setup(u.merge({
    debug = false,
    disable_commands = false,
    enable_import_on_completion = true,

    -- import all
    import_all_timeout = 5000, -- ms
    import_all_priorities = {
      buffers = 4, -- loaded buffer names
      buffer_content = 3, -- loaded buffer content
      local_files = 2, -- git files or files with relative path markers
      same_file = 1, -- add to existing import statement
    },
    import_all_scan_buffers = 100,
    import_all_select_source = false,

    -- inlay hints
    auto_inlay_hints = true,
    inlay_hints_highlight = 'Comment',

    -- update imports on file move
    update_imports_on_move = true,
    require_confirmation_on_move = false,
    watch_dir = nil,

    -- filter diagnostics
    filter_out_diagnostics_by_severity = {},
    filter_out_diagnostics_by_code = {},
  }, config.lsp.ts_utils or {}))

  -- required to fix code action ranges and filter diagnostics
  ts_utils.setup_client(client)
end

return M

