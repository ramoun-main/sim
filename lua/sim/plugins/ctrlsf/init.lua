return {
  'dyng/ctrlsf.vim',
  event = 'BufEnter',
  config = function()
    vim.keymap.set('n', '<C-f>f', '<cmd>CtrlSFPrompt<CR>')
    vim.keymap.set('n', '<C-f>n', '<cmd>CtrlSFCwordPath<CR>')
    vim.keymap.set('n', '<C-f>p', '<cmd>CtrlPFCwordPath<CR>')
  end,
  opts = {
    ctrlp_show_hidden = 1,
  },
}
