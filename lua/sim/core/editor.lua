local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

local indent = 2

-- dynamic detection based on file extension and file contents
cmd([[
	filetype plugin indent on
]])

-- add a new empty line
_G.add_new_line = function()
  local n_lines = vim.api.nvim_buf_line_count(0)
  local last_nonblank = vim.fn.prevnonblank(n_lines)
  if last_nonblank <= n_lines then
    vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { ' ' })
  end
end

cmd([[
  augroup AddNewlineOnSave
    autocmd!
    autocmd BufWritePre * lua _G.add_new_line()
  augroup END
]])

-- remove lines at the end of a buffer
local augroup_name = 'SimEditorClean'
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  command = [[%s/\s\+$//e]],
  group = group,
})

g.mapleader = ' '

-- misc
opt.backspace = { 'eol', 'start', 'indent' }
opt.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard
opt.encoding = 'utf-8'
opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
opt.syntax = 'enable'

-- indention
opt.autoindent = true -- automatic indentation based on context
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = indent -- the number of spaces inserted for each indentation level
opt.smartindent = true -- make indenting smarter again - indent based on context (useful for langs like python)
opt.softtabstop = indent -- insert 2 spaces for a soft tab
opt.tabstop = indent -- insert 2 spaces for a tab

-- search
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case search. if the search term in lowercase (it will ignore case) - if it is not (it will not ignore case)
opt.wildignore = opt.wildignore
  + { '*/node_modules/*', '*/.git/*', '*/vendor/*', '*/__pycache__/*', '*/.obj/*', '*/.o/*', '*/.class/*' } -- files and directories to ignore on file completion or searching feaures
opt.wildmenu = true -- a menu that shows on completion options for commands

-- ui
opt.cursorline = true -- highlight the current line
opt.laststatus = 2
-- hide certain visuals on certain operations
--[[ opt.lazyredraw = true ]]
opt.list = true -- display special characters on the screen
opt.listchars = {
  tab = '❘-',
  trail = '·',
  lead = '·',
  extends = '»',
  precedes = '«',
  nbsp = '×',
}
opt.mouse = 'a' -- allow the mouse to be used in neovim - a: means all modes
opt.number = true -- set numbered lines
opt.rnu = true -- rnu is a shorthand for relativenumber
opt.scrolloff = 18 -- forcing certain number of lines to be always visible above and below the cursor on scrolling
opt.sidescrolloff = 7 -- 8 -- Lines to scroll horizontally
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.signcolumn = 'yes' -- always show the sign column, otherwise it would shift the text each time, also used by other plugins like git signs to show edited lines and so on.
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.wrap = true -- display lines as one long line

-- backups -- TODO: we need to bring these back or find another backup mechanism to neovim
opt.backup = false
opt.swapfile = false -- creates a swapfile
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- autocomplete
opt.completeopt = { 'menu', 'menuone', 'noselect' } -- controls behaviour of auto-complete menu
opt.shortmess = opt.shortmess + { c = true }
--[[ opt.shortmess:append('c') ]]

-- perfomance
opt.redrawtime = 1500 -- prioritize responsiveness by limitting redrawtime to only 1500
opt.timeoutlen = 1000 -- 200 - time to wait for a mapped sequence to complete (in milliseconds)
opt.ttimeoutlen = 20 -- after how much time does key stroke considered a new sequence (useful for vim motions and other )
opt.updatetime = 300 -- 100 - faster completion (4000ms default)

-- theme
opt.termguicolors = true -- set term gui colors (most terminals support this)

-- -- -- -- -- -- -- -- -- -- -- -- Begin -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- :help options
--
opt.fileencoding = 'utf-8' -- the encoding written to a file
opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.showtabline = 2 -- always show tabs
opt.undofile = true -- enable persistent undo

opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.guifont = 'JetBrains Mono:h17' -- the font used in graphical neovim applications

vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

-- See :h vim.keymap for more info
