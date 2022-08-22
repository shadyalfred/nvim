require('dired').setup {
  path_separator = '/',
  show_banner = false,
  show_hidden = true
}

vim.keymap.set({ 'n',  'v' }, '<Leader>ff', ':Dired<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n',  'v' }, '<Leader>ff', ':Dired<CR>', { noremap = true, silent = true })
