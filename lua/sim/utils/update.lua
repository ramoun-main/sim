package.path = package.path .. ';../../../editor-name.lua'
local editor_name = require('editor-name')

local M = {}

function M.get_install_dir()
  local config_dir = os.getenv(string.format('%s_INSTALL_DIR', string.upper(editor_name)))
  if not config_dir then
    return vim.fn.stdpath('config')
  end
  return config_dir
end

-- update instance of Sim Editor
function M.update()
  local Logger = require(string.format('%s.utils.logger', editor_name))
  local Job = require('plenary.job')
  local path = M.get_install_dir()
  local errors = {}

  Job:new({
    command = 'git',
    args = { 'pull', '--ff-only' },
    cwd = path,
    on_start = function()
      Logger:log('Updating...')
    end,
    on_exit = function()
      if vim.tbl_isempty(errors) then
        Logger:log(string.format('Updated! Running %sReloadSync...', editor_name))
        M.reload_user_config_sync()
      else
        table.insert(errors, 1, 'Something went wrong! Please pull changes manually.')
        table.insert(errors, 2, '')
        Logger:error('Update failed!', { timeout = 30000 })
      end
    end,
    on_stderr = function(_, err)
      table.insert(errors, err)
    end,
  }):sync()
end

return M
