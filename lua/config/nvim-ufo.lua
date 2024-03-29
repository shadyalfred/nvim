-- vim.opt.foldcolumn     = '1'
vim.opt.foldlevel      = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable     = true

-- uses treesitter
require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end
})

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
