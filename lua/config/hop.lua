local hop = require('hop')
hop.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.keymap.set({'n', 'v'}, 's', '<Cmd> HopChar2CurrentLineAC <Cr>')
vim.keymap.set({'n', 'v'}, 'S', '<Cmd> HopChar2CurrentLineBC <Cr>')

vim.keymap.set({'n', 'v'}, 'gsk', '<Cmd> :HopVerticalBC <Cr>')
vim.keymap.set({'n', 'v'}, 'gsj', '<Cmd> :HopVerticalAC <Cr>')

vim.keymap.set({'n', 'v'}, 'gs/', '<Cmd> :HopPatternAC <Cr>')
vim.keymap.set({'n', 'v'}, 'gs?', '<Cmd> :HopPatternBC <Cr>')

vim.keymap.set({'n', 'v'}, 'gsw', '<Cmd> :HopWordAC <Cr>')
vim.keymap.set({'n', 'v'}, 'gsW', '<Cmd> :HopWordBC <Cr>')
