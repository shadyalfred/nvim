require('colorful-winsep').setup({
  -- highlight for Window separator
  highlight = {
    guibg = '#24283b',
    guifg = '#7aa2f7',
  },
  -- timer refresh rate
  interval = 30,
  -- This plugin will not be activated for filetype in the following table.
  no_exec_files = { 'packer', 'TelescopePrompt', 'mason', 'CompetiTest', 'NvimTree' },
  -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
  symbols = { '━', '┃', '┏', '┓', '┗', '┛' },
})
