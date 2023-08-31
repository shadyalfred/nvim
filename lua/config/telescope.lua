local telescope = require('telescope')

telescope.load_extension('fzf')

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, '\n', '')
  if #text > 0 then
    return text
  else
    return ''
  end
end

local tb = require('telescope.builtin')

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
  '<Leader><Leader>',
  '<cmd>Telescope find_files<cr>',
  { noremap = true, silent = true }
)

vim.keymap.set(
  'v',
  '<Leader>pf',
  function()
    local text = vim.getVisualSelection()
    tb.find_files({ default_text = text })
  end,
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>sp',
  '<cmd>Telescope live_grep<cr>',
  { noremap = true, silent = true }
)

vim.keymap.set(
  'v',
  '<Leader>sp',
  function()
    local text = vim.getVisualSelection()
    tb.live_grep({ default_text = text })
  end,
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>ps',
  '<cmd>Telescope live_grep<cr>',
  { noremap = true, silent = true }
)

vim.keymap.set(
  'v',
  '<Leader>ps',
  function()
    local text = vim.getVisualSelection()
    tb.live_grep({ default_text = text })
  end,
  { noremap = true, silent = true }
)


vim.api.nvim_set_keymap(
  'n',
  '<Leader>fr',
  '<cmd>Telescope oldfiles<cr>',
  { noremap = true, silent = true }
)

vim.keymap.set(
  { 'n', 'v' },
  '<Leader>:',
  '<cmd>Telescope commands<cr>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>sj',
  '<cmd>Telescope lsp_document_symbols<cr>',
  { noremap = true, silent = true }
)
