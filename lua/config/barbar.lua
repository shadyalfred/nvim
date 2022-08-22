require('bufferline').setup {
  animation = true,
  auto_hide = false,
  closable = true,
  clickable = true,
  icons = true,
  icon_custom_colors = false,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '[b', '<Cmd>BufferPrevious<CR>', opts)
map('n', ']b', '<Cmd>BufferNext<CR>', opts)
map('n', 'gT', '<Cmd>BufferPrevious<CR>', opts)
map('n', 'gt', '<Cmd>BufferNext<CR>', opts)
-- Magic buffer-picking mode
map('n', '<Space>bb', ':BufferPick<CR>', opts)

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.state'.set_offset(31, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.state'.set_offset(0)
    end
  end
})
