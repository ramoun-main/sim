local editor_name = 'sim'

return {
  '0x00-ketsu/markdown-preview.nvim',
  ft = { 'md', 'markdown', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'rmd', 'wiki' },
  init = function()
    require(string.format('%s.plugins.markdown-preview.mappings', editor_name))
  end,
  config = function()
    require('markdown-preview').setup({
      term = {
        direction = 'vertical', -- choices: vertical / horizontal
        keys = {
          close = { 'q', '<Esc>' },
          refresh = 'r',
        },
      },
    })
  end,
}
