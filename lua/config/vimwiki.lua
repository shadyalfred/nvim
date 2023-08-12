vim.g.vimwiki_list = {{
  path   = vim.env.HOME .. '/HDD/Obsidian',
  index  = 'Index',
  syntax = 'markdown',
  ext    = '.md'
}}

vim.g.vimwiki_global_ext = 0

vim.g.vimwiki_key_mappings = { all_maps = 0 }

vim.g.vimwiki_create_link = 1

vim.keymap.set(
  'n',
  '<Leader>ww',
  function()
    vim.cmd[[cd ~/Obsidian]]
    vim.cmd[[VimwikiIndex]]
  end,
  { noremap = true, silent = true }
)

vim.cmd[[autocmd FileType vimwiki UfoDetach]]
vim.cmd[[autocmd FileType vimwiki inoremap <silent><buffer> <CR> <C-]><Esc>:VimwikiReturn 3 5<CR>]]
vim.cmd[[autocmd FileType vimwiki nnoremap <silent><buffer> <CR> <Plug>VimwikiFollowLink]]
vim.cmd[[autocmd FileType vimwiki nnoremap <silent><buffer> <C-CR> <Plug>VimwikiToggleListItem]]
vim.cmd[[autocmd FileType vimwiki setlocal foldlevel=0]]

vim.g.vimwiki_folding = 'expr'
