vim.keymap.set('n', '<Leader>pS', '<Cmd>lua require("spectre").open()<CR>')

vim.keymap.set('n', '<Leader>sw', '<Cmd>lua require("spectre").open_visual({select_word=true})<CR>')
vim.keymap.set('v', '<Leader>s', '<Esc>:lua require("spectre").open_visual()<CR>')

vim.keymap.set('n', '<Leader>sf', 'viw:lua require("spectre").open_file_search()<CR>')
