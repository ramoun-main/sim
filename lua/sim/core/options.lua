local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

local indent = 2

local options = {
  -- disable unFoldAll by default
  foldlevelstart = 99, -- disable unFoldAll by default

  -- misc
  backspace = { 'eol', 'start', 'indent' },
  clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
  encoding = 'utf-8',
  matchpairs = { '(:)', '{:}', '[:]', '<:>' },
  syntax = 'enable',

  -- indention
  autoindent = true, -- automatic indentation based on context
  expandtab = true, -- convert tabs to spaces
  shiftwidth = indent, -- the number of spaces inserted for each indentation level
  smartindent = true, -- make indenting smarter again,  - indent based on context (useful for langs like python)
  softtabstop = indent, -- insert 2 spaces for a soft tab
  tabstop = indent, -- insert 2 spaces for a tab

  -- search
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case search. if the search term in lowercase (it will ignore case) - if it is not (it will not ignore case)
  wildignore = opt.wildignore
    + { '*/node_modules/*', '*/.git/*', '*/vendor/*', '*/__pycache__/*', '*/.obj/*', '*/.o/*', '*/.class/*' }, -- files and directories to ignore on file completion or searching feaures
  wildmenu = true, -- a menu that shows on completion options for commands

  -- ui
  cursorline = true, -- highlight the current line
  laststatus = 2,
  -- hide certain visuals on certain operations
  --[[lazyredraw = true ]]
  list = true, -- display special characters on the screen
  listchars = {
    tab = '|-',
    trail = '·',
    lead = '·',
    extends = '»',
    precedes = '«',
    nbsp = '×',
  },
  mouse = 'a', -- allow the mouse to be used in neovim  - a: means all modes
  number = true, -- set numbered lines
  rnu = true, -- rnu is a shorthand for relativenumber
  scrolloff = 18, -- forcing certain number of lines to be always visible above and below the cursor on scrolling
  sidescrolloff = 7, -- 8 -- Lines to scroll horizontally
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time, also used by other plugins like git signs to show edited lines and so on.
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  wrap = true, -- don't display lines as one long line
  breakindent = true, --Enable break indent

  -- backups -- TODO: we need to bring these back or find another backup mechanism to neovim;
  backup = false,
  swapfile = false, -- creates a swapfile
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

  -- autocomplete
  completeopt = { 'menu', 'menuone', 'noselect' }, -- controls behaviour of aut, o-complete menu
  shortmess = opt.shortmess + { c = true },
  --[[ opt.shortmess:append('c') ]]

  -- perfomance
  redrawtime = 1500, -- prioritize responsiveness by limitting redrawtime to only 1500
  timeoutlen = 1000, -- 200  - time to wait for a mapped sequence to complete (in milliseconds) - whichkey popup
  ttimeoutlen = 20, -- after how much time does key stroke considered a new sequence (useful for vim motions and other )
  updatetime = 300, -- 100 - faster completion (4000ms default)

  -- theme
  termguicolors = true, -- set term gui colors (most terminals support this)

  -- -- -- -- -- -- -- -- -- -- -- -- Begin -- -- -- -- -- -- -- -- -- -- -- -- -- --
  -- :help
  --
  fileencoding = 'utf-8', -- the encoding written to a file
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  conceallevel = 0, -- so that `` is visible in markdown files
  showtabline = 2, -- always show tabs
  undofile = true, -- enable persistent undo

  numberwidth = 5, -- set number column width to 2 {default 4}
  guifont = 'JetBrains Mono:h17', -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  opt[k] = v
end
