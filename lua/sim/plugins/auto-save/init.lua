return {
  'Pocco81/auto-save.nvim',
  event = 'VimEnter',
  config = function()
    require('auto-save').setup({
      enabled = false,
      vim.api.nvim_set_keymap('n', '<leader><leader>a', ':ASToggle<CR>', { desc = 'Toggle AutoSave' }),

      execution_message = {
        dim = 0.16, -- dim the color of `message`
        cleaning_interval = 650, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
      },
      trigger_events = { 'InsertLeave', 'TextChanged', 'ExitPre' }, -- vim events that trigger auto-save. See :h events

      -- function that determines whether to save the current buffer or not
      -- return true: if buffer is ok to be saved
      -- return false: if it's not ok to be saved
      condition = function(buf)
        local fn = vim.fn
        local utils = require('auto-save.utils.data')

        if fn.getbufvar(buf, '&modifiable') == 1 and utils.not_in(fn.getbufvar(buf, '&filetype'), {}) then
          return true -- met condition(s), can save
        end
        return false -- can't save
      end,
      debounce_delay = 235, -- saves the file at most every `debounce_delay` milliseconds
      callbacks = { -- functions to be executed at different intervals
        enabling = nil, -- ran when enabling auto-save
        disabling = nil, -- ran when disabling auto-save
        before_asserting_save = nil, -- ran before checking `condition`
        before_saving = nil, -- ran before doing the actual save
        after_saving = nil, -- ran after doing the actual save
      },
    })
  end,
}
