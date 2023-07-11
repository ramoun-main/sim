package.path = package.path .. ';../../../../editor-name.lua'
local editor_name = require('editor-name')

local user_config = require(string.format('%s.core.user', editor_name))
local icons = require(string.format('%s.utils.icons', editor_name))
local g = vim.g

return {
  'glepnir/dashboard-nvim',
  config = function()
    g.dashboard_custom_header = {
      '',
      '',
      '',
      '',
      '',
      '███████╗ ██████╗ ███████╗ ██████╗',
      '██╔════╝██╔═══██╗██╔════╝██╔═══██╗',
      '███████╗██║   ██║███████╗██║   ██║',
      '╚════██║██║   ██║╚════██║██║   ██║',
      '███████║╚██████╔╝███████║╚██████╔╝',
      '╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝ ',
      '',
      '',
    }

    g.dashboard_default_executive = 'telescope'

    g.dashboard_session_directory = vim.fn.stdpath('data') .. '/sessions'

    g.dashboard_custom_section = {
      find_file = {
        description = { icons.file1 .. ' Find File           <leader>ff' },
        command = string.format('lua require("%s.plugins.telescope.mappings").project_files()', editor_name),
      },
      file_explorer = {
        description = { icons.file2 .. ' File Manager        <C-n>     ' },
        command = 'NvimTreeToggle',
      },
      find_string = {
        description = { icons.word .. ' Grep String         <leader>fs' },
        command = 'Telescope grep_string',
      },
      last_session = {
        description = { icons.clock .. ' Load Session        <leader>Sl' },
        command = 'lua vim.cmd(":silent RestoreSession")',
      },
    }

    g.dashboard_custom_footer = { '💫 github.com/ramoun-main/nvim' }
  end,
  event = 'VimEnter',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'dashboard'),
}
