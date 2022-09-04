require('orgmode').setup_ts_grammar()

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup()

vim.cmd[[autocmd FileType org setlocal nofoldenable]]
