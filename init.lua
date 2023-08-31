require('config.general')

require('lazy-init')

local plugins = require('plugins')
require('lazy').setup(plugins)

require('config.neovide')
