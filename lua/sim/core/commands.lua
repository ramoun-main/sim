-- TODO: Very Important to Check these Commands and Fix the Problems within them
local editor_name = 'sim'
local cmd = vim.cmd

local augroup_name = editor_name
local group = vim.api.nvim_create_augroup(augroup_name .. 'Editor', { clear = true })

-- make tabs equal on window resize
vim.api.nvim_create_autocmd('VimResized', {
  command = 'tabdo wincmd =',
  group = group,
})

cmd(string.format([[ command! UpdateEditor lua require('%s.utils.update').update() ]], editor_name))

cmd([[
  set noendofline
  set nofixendofline
]])

-- dynamic detection based on file extension and file contents
cmd([[
	filetype plugin indent on
]])

cmd([[
  autocmd BufWinEnter * silent! :%foldopen!
]])

-- remove lines at the end of a buffer
local augroup_name = 'SimEditorClean'
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  command = [[%s/\s\+$//e]],
  group = group,
})

-- add new empty line at end of file on save
-- Add new line to the end of the file
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = vim.api.nvim_create_augroup('UserOnSave', {}),
  pattern = '*',
  callback = function()
    local n_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(n_lines)
    if last_nonblank <= n_lines then
      vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { '' })
    end
  end,
})

cmd('set whichwrap+=<,>,[,],h,l')
cmd([[set iskeyword+=-]])
cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work


-- Highlight on yank
cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- See :h vim.keymap for more info

