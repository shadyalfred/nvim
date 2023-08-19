require('nvim-treesitter.configs').setup {
  sync_install = false,

  auto_install = true,

  autotag = {
    enable = true
  },

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

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'markdown' }
  },

  indent = {
    enable = true
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = 'gnn',
      scope_incremental = '<CR>',    -- grc
      node_incremental  = '<TAB>',   -- grn 
      node_decremental  = '<S-TAB>', -- grm
    },
  },

  textobjects = {
    select = {
      enable = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr   = 'nvim_treesitter#foldexpr()'

-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })
