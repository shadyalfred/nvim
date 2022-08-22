require('telescope').setup()


vim.api.nvim_set_keymap(
  'n',
  '<Leader>bb',
  '<cmd>Telescope buffers<cr>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>pf',
  '<cmd>Telescope find_files<cr>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>sp',
  '<cmd>Telescope live_grep<cr>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>ps',
  '<cmd>Telescope live_grep<cr>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>fr',
  '<cmd>Telescope <cr>',
  { noremap = true, silent = true }
)

vim.keymap.set(
  { 'n', 'v' },
  '<Leader><Leader>',
  '<cmd>Telescope commands<cr>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>sj',
  '<cmd>Telescope lsp_document_symbols<cr>',
  { noremap = true, silent = true }
)
