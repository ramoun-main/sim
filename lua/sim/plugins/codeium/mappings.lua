local editor_name = 'sim'

local map = require(string.format('%s.utils', editor_name)).map

map('i', '<M-g>', function()
  return vim.fn['codeium#Accept']()
end, { expr = true })
map('i', '<Tab>', function()
  return vim.fn['codeium#CycleCompletions'](1)
end, { expr = true })
map('i', '<S-Tab>', function()
  return vim.fn['codeium#CycleCompletions'](-1)
end, { expr = true })
map('i', '<M-x>', function()
  return vim.fn['codeium#Clear']()
end, { expr = true })
