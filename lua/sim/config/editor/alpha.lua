dashboard.section.buttons.val = {
  button(
    '<C-P>',
    icons.fileNoBg .. ' ' .. 'Find File',
    "<cmd>lua require('plugins.telescope').project_files()<CR>",
    {}
  ),
  button('<S-P>', icons.word .. ' ' .. 'Find Word', "<cmd>lua require('plugins.telescope.pickers.multi-rg')()<CR>", {}),
  button('SPC s h', icons.fileRecent .. ' ' .. 'Recents', '<cmd>Telescope oldfiles hidden=true<CR>', {}),
  button(
    'SPC / s d',
    icons.timer .. ' ' .. 'Load Current Dir Session',
    '<cmd>SessionManager load_current_dir_session<CR>',
    {}
  ),
  button('SPC / u', icons.packageDown .. ' ' .. 'Update Plugins', '<cmd>Lazy update<CR>', {}),
  button('SPC / i', icons.package .. ' ' .. 'Manage Plugins', '<cmd>Lazy<CR>', {}),
  button('SPC / c', icons.cog .. ' ' .. 'Settings', '<cmd>e $MYVIMRC<CR>', {}),
  button('-', icons.exit .. ' ' .. 'Exit', '<cmd>exit<CR>', {}),
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Footer                                                   │
-- ╰──────────────────────────────────────────────────────────╯

local function file_exists(file)
  local f = io.open(file, 'rb')
  if f then
    f:close()
  end
  return f ~= nil
end

local function line_from(file)
  if not file_exists(file) then
    return {}
  end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local function footer()
  local plugins = require('lazy').stats().count
  local v = vim.version()
  local ecovim_version = line_from(config_dir .. '/.ecovim.version')
  return string.format(' v%d.%d.%d  󰂖 %d   %s ', v.major, v.minor, v.patch, plugins, ecovim_version[1])
end

dashboard.section.footer.val = {
  footer(),
}
dashboard.section.footer.opts = {
  position = 'center',
  hl = 'EcovimFooter',
}

local section = {
  header = dashboard.section.header,
  hi_top_section = hi_top_section,
  hi_middle_section = hi_middle_section,
  hi_bottom_section = hi_bottom_section,
  buttons = dashboard.section.buttons,
  footer = dashboard.section.footer,
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup                                                    │
-- ╰──────────────────────────────────────────────────────────╯

local opts = {
  layout = {
    { type = 'padding', val = 3 },
    section.header,
    { type = 'padding', val = 1 },
    section.hi_top_section,
    section.hi_middle_section,
    section.hi_bottom_section,
    { type = 'padding', val = 2 },
    section.buttons,
    { type = 'padding', val = 3 },
    section.footer,
  },
  opts = {
    margin = 5,
  },
}

alpha.setup(opts)

-- ╭──────────────────────────────────────────────────────────╮
-- │ Hide tabline and statusline on startup screen            │
-- ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_create_augroup('alpha_tabline', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'alpha_tabline',
  pattern = 'alpha',
  command = 'set showtabline=0 laststatus=0 noruler',
})

vim.api.nvim_create_autocmd('FileType', {
  group = 'alpha_tabline',
  pattern = 'alpha',
  callback = function()
    vim.api.nvim_create_autocmd('BufUnload', {
      group = 'alpha_tabline',
      buffer = 0,
      command = 'set showtabline=2 ruler laststatus=3',
    })
  end,
})
