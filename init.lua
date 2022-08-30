require('plugins')

require('guess-indent').setup {}

require('config.nvim-tree')

require('config.dired')

require('config.nvim-treesitter')

require('orgmode').setup_ts_grammar()
require('orgmode').setup {}

require('Comment').setup()

require('config')
require('config.lualine')
require('config.tabby')

require('config.align')

require('config.maximize')

require('config.nvim-cmp')
require('config.lsp')
require('config.trouble')

require('config.nvim-dap')
require('config.rust-tools')

require('config.telescope')
