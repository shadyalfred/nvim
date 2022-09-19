require('plugins')

require('guess-indent').setup {}

require('config.nvim-tree')

require('config.nvim-treesitter')

require('orgmode').setup_ts_grammar()
require('orgmode').setup {}

require('Comment').setup()

require('config')
require('config.sneak')
require('config.easymotion')

require('config.lualine')
require('config.tabby')

require('config.dired')

require('config.align')

require('config.maximize')

require('config.nvim-cmp')
require('config.lsp')
require('config.trouble')

require('config.nvim-ufo')

require('config.nvim-dap')

require('config.rust-tools')
require('config.go')

require('config.telescope')
require('config.neogit')

require('config.orgmode')
