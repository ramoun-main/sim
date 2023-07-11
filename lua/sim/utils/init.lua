local M = {}

function M.map(mode, lhs, rhs, opts)
  local defaults = {
    silent = true,
    noremap = true,
  }
  vim.keymap.set(mode, lhs, rhs, M.merge(defaults, opts or {}))
end

function M.create_buf_map(bufnr, opts)
  return function(mode, lhs, rhs, map_opts)
    M.map(
      mode,
      lhs,
      rhs,
      M.merge({
        buffer = bufnr,
      }, opts or {}, map_opts or {})
    )
  end
end

function M.merge_list(tbl1, tbl2)
  for _, v in ipairs(tbl2) do
    table.insert(tbl1, v)
  end
  return tbl1
end

function M.merge(...)
  return vim.tbl_deep_extend('force', ...)
end

function M.split(str, sep)
  local res = {}
  for w in str:gmatch('([^' .. sep .. ']*)') do
    if w ~= '' then
      table.insert(res, w)
    end
  end
  return res
end

function M.get_short_file_path(path)
  local dirs = {}
  for dir in string.gmatch(path, '([^/]+)') do
    table.insert(dirs, dir)
  end

  local n = #dirs
  if n > 3 then
    return '../' .. dirs[n - 2] .. '/' .. dirs[n - 1] .. '/' .. dirs[n]
  end

  return path
end

function M.get_short_cwd()
  local parts = vim.split(vim.fn.getcwd(), '/')
  return parts[#parts]
end

function M.diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, 'lazy.core.config')
  return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

function M.show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then
    return ''
  else
    return 'Recording @' .. recording_register
  end
end

--- Open a URL under the cursor with the current operating system
---@param path string The path of the file to open with the system opener
function M.system_open(path)
  local cmd
  if vim.fn.has('win32') == 1 and vim.fn.executable('explorer') == 1 then
    cmd = { 'cmd.exe', '/K', 'explorer' }
  elseif vim.fn.has('unix') == 1 and vim.fn.executable('xdg-open') == 1 then
    cmd = { 'xdg-open' }
  elseif (vim.fn.has('mac') == 1 or vim.fn.has('unix') == 1) and vim.fn.executable('open') == 1 then
    cmd = { 'open' }
  end
  if not cmd then
    M.notify('Available system opening tool not found!', vim.log.levels.ERROR)
  end
  vim.fn.jobstart(vim.fn.extend(cmd, { path or vim.fn.expand('<cfile>') }), { detach = true })
end

return M
