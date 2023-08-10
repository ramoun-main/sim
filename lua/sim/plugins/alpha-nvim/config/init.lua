local button = require('sim.plugins.alpha-nvim.config.button')
local icons = require('sim.utils.icons')
local M = {}

function M.setup()
  local status_ok, alpha = pcall(require, 'alpha')
  if not status_ok then
    return
  end

  local dashboard = require('alpha.themes.dashboard')

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ Header                                                   │
  -- ╰──────────────────────────────────────────────────────────╯

  local function header()
    return {
      '   ▄████████    ▄█     ▄▄▄▄███▄▄▄▄  ',
      '  ███    ███   ███   ▄██▀▀▀███▀▀▀██▄',
      '  ███    █▀    ███▌  ███   ███   ███',
      '  ███          ███▌  ███   ███   ███',
      '▀███████████   ███▌  ███   ███   ███',
      '         ███   ███   ███   ███   ███',
      '   ▄█    ███   ███   ███   ███   ███',
      ' ▄████████▀    █▀     ▀█   ███   █▀ ',
    }
  end

  dashboard.section.header.type = 'text'
  dashboard.section.header.val = header()
  dashboard.section.header.opts = {
    position = 'center',
    hl = 'Sim',
  }

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ Heading Info                                             │
  -- ╰──────────────────────────────────────────────────────────╯

  local dateSeed =
      io.popen('echo "$(LANG=en_us_88591; date +%a) $(date +%d) $(LANG=en_us_88591; date +%b)" | tr -d "\n"')
  if dateSeed == nil then
    return
  end
  local date = dateSeed:read('*a')
  dateSeed:close()

  local datetime2 = os.date(' %H:%M')

  local hi_top_section = {
    type = 'text',
    val = '┌────────────   Today is '
        .. date
        .. ' ────────────┐',
    opts = {
      position = 'center',
      hl = 'HeaderInfo',
    },
  }

  local hi_middle_section = {
    type = 'text',
    val = '│                                                │',
    opts = {
      position = 'center',
      hl = 'HeaderInfo',
    },
  }

  local hi_bottom_section = {
    type = 'text',
    val = '└───══───══───══───  '
        .. datetime2
        .. '  ───══───══───══────┘',
    opts = {
      position = 'center',
      hl = 'HeaderInfo',
    },
  }

  dashboard.section.buttons.val = {
    button(
      '<C-P>',
      icons.eco.fileNoBg .. ' ' .. 'Find File',
      "<cmd>lua require('plugins.telescope').project_files()<CR>",
      {}
    ),
    button(
      '<S-P>',
      icons.eco.word .. ' ' .. 'Find Word',
      "<cmd>lua require('plugins.telescope.pickers.multi-rg')()<CR>",
      {}
    ),
    button('SPC s h', icons.eco.fileRecent .. ' ' .. 'Recents', '<cmd>Telescope oldfiles hidden=true<CR>', {}),
    button(
      'SPC / s d',
      icons.eco.timer .. ' ' .. 'Load Current Dir Session',
      '<cmd>SessionManager load_current_dir_session<CR>',
      {}
    ),
    button('SPC / u', icons.eco.packageDown .. ' ' .. 'Update Plugins', '<cmd>Lazy update<CR>', {}),
    button('SPC / i', icons.eco.package .. ' ' .. 'Manage Plugins', '<cmd>Lazy<CR>', {}),
    button('SPC / c', icons.eco.cog .. ' ' .. 'Settings', '<cmd>e $MYVIMRC<CR>', {}),
    button('-', icons.eco.exit .. ' ' .. 'Exit', '<cmd>exit<CR>', {}),
  }

  dashboard.section.buttons.val = {
    dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
    dashboard.button('c', '  Configuration', ':e $MYVIMRC <CR>'),
    dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
  }

  local function footer()
    -- Number of plugins
    --[[ local total_plugins = #vim.tbl_keys(require('sim.plugins')) ]]
    local total_plugins = 33
    local datetime = os.date('%d-%m-%Y  %H:%M:%S')
    local plugins_text = '\t' .. total_plugins .. ' plugins  ' .. datetime

    -- Quote
    local fortune = require('alpha.fortune')
    local quote = table.concat(fortune(), '\n')

    return plugins_text .. '\n' .. quote
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = 'Constant'
  dashboard.section.header.opts.hl = 'Include'
  dashboard.section.buttons.opts.hl = 'Function'
  dashboard.section.buttons.opts.hl_shortcut = 'Type'
  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end

return M
