require('config.general')

require('lazy-init')

local plugins = require('plugins')
require('lazy').setup(plugins)

if vim.g.neovide then
  require('config.neovide')
end
