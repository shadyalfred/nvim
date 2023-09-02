require('config.general')

require('lazy-init')

local plugins = require('plugins')
require('lazy').setup(plugins, {
  dev = {
    path = '~/HDD/Projects'
  },
})

if vim.g.neovide then
  require('config.neovide')
end
