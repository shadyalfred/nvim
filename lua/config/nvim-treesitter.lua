require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'lua',
    'html',
    'css',
    'php',
    'javascript',
    'typescript',
    'c_sharp',
    'java',
    'json',
    'markdown',
    'markdown_inline',
    'org',
    'toml',
    'yaml',
  },
  sync_install = false,

  highlight = {
    enable = true,
  },

  indent = {
    enable = true
  },

  auto_install = true,
}

vim.wo.foldmethod = 'manual'
-- vim.wo.foldexpr   = 'nvim_treesitter#foldexpr()'

-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })
