local opt = vim.opt

local options = {
  emoji          = true,                   --- Fix emoji display
  foldcolumn     = "0",
  foldnestmax    = 0,
  laststatus     = 3,                       --- Have a global statusline at the bottom instead of one for each window
  pumheight      = 10,                      --- Max num of items in completion menu
  -- Neovim defaults
  --- Concealed text is completely hidden unless it has a custom replacement character defined (needed for dynamically showing tailwind classes)
  conceallevel   = 2,
  concealcursor  = "",                      --- Set to an empty string to expand tailwind class when on cursorline
  errorbells     = false,                   --- Disables sound effect for errors
  incsearch      = true,                    --- Start searching before pressing enter
}

opt.formatoptions:remove('c');
opt.formatoptions:remove('r');
opt.formatoptions:remove('o');
opt.fillchars:append('stl: ');
opt.fillchars:append('eob: ');
opt.fillchars:append('fold: ');
opt.fillchars:append('foldopen: ');
opt.fillchars:append('foldsep: ');
opt.fillchars:append('foldclose:');

for k, v in pairs(options) do
  opt[k] = v
end

