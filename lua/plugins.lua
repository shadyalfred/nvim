return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      if vim.env.TERM == 'xterm' then
        vim.cmd[[colorscheme tokyonight-day]]
        vim.cmd[[set termbidi]]
        vim.cmd[[set arabic]]
      else
        vim.cmd[[colorscheme tokyonight]]
      end
    end
  },

  {
    'max397574/better-escape.nvim',
    opts = {
      mapping = { 'kj' },
      timeout = 100,
    }
  },

  'nvim-lua/plenary.nvim',

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('config.nvim-treesitter')
    end
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
      'nvim-treesitter',
      'nvim-treesitter/nvim-treesitter',
    },
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('config.nvim-ufo')
    end,
  },

  'tpope/vim-repeat',
  {
    'Vonr/align.nvim',
    keys = {
      {
        'ga',
        function()
          require('align').align_to_char(2, true, true)
        end,
        mode = 'x',
        desc = 'Align selection with 1 or 2 chars',
      },
    },
  },

  {
    'kylechui/nvim-surround',
    version = '*',
    config = true,
  },

  {
    'windwp/nvim-autopairs',
    opts = {
      disable_filetype       = {
        'TelescopePrompt',
        'text',
        'markdown',
      },
      disable_in_macro       = true,
      disable_in_visualblock = true,
      break_undo             = false,
    },
    event = 'InsertEnter',
  },

  {
    'folke/flash.nvim',
    opts = {
      label = {
        after = false,
        before = true,
      },
      highlight = {
        backdrop = false,
      },
      search = {
        wrap = false,
        multi_window = false,
      },
      modes = {
        char = {
          highlight = {
            backdrop = false,
          }
        }
      }
    },
    keys = {
      {
        's',
        function()
          require('flash').jump({
            search = {
              forward = true,
              wrap = false,
              multi_window = false
            },
            label = {
              after = false,
              before = true,
            },
          })
        end,
        mode = {'n', 'x', 'o'},
        desc = 'flash search'
      },
      {
        'gsj',
        function()
          local col = vim.api.nvim_win_get_cursor(0)[2]

          require('flash').jump({
            jump = {
              offset = col,
            },
            search = {
              mode = 'search',
              max_length = 0,
              forward = true,
              wrap = false,
              multi_window = false,
            },
            pattern = '^',
            label = {
              before = { 0, col },
              after = false,
            },
            highlight = {
              matches = false,
            },
          })
        end,
        mode = {'n', 'x', 'o'},
        desc = 'flash go to line below',
      },
      {
        'gsk',
        function()
          local col = vim.api.nvim_win_get_cursor(0)[2]

          require('flash').jump({
            jump = {
              offset = col,
            },
            search = {
              mode = 'search',
              max_length = 0,
              forward = false,
              wrap = false,
              multi_window = false,
            },
            pattern = '^',
            label = {
              before = { 0, col },
              after = false,
            },
            highlight = {
              matches = false,
            },
          })
        end,
        mode = {'n', 'x', 'o'},
        desc = 'flash go to line up',
      }
    },
    config = function()
      vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#000000', bg = '#ff007c' })
    end,
  },

  {
    'NMAC427/guess-indent.nvim',
    config = true,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    priority = 100,
    config = function()
      require('config.lualine')
    end
  },

  {
    'nanozuki/tabby.nvim',
    config = function()
      require('config.tabby')
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      extensions = {
        file_browser = {
          theme = 'ivy',
          hijack_netrw = true,
        },
      },
    },
    config = function()
      require('config.telescope')
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      hijack_netrw = false,
      sync_root_with_cwd = true,
      view = {
        side = 'right'
      },
    },
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      {
        '<Leader>op',
        '<Cmd>NvimTreeToggle<CR>',
        desc = 'Toggle nvim-tree',
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp')
    end
  },

  'onsails/lspkind.nvim',

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip'
    },
    config = function()
      require('config.nvim-cmp')
    end,
  },

  {
    'hrsh7th/vim-vsnip',
    dependencies =  {
      'hrsh7th/vim-vsnip-integ',
      'rafamadriz/friendly-snippets',
    }
  },

  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      height = 5,
    },
    keys = {
      {
        '<Leader>dl',
        '<Cmd>Trouble<CR>',
        desc = '[Trouble] List errors',
      },
      {
        '<Leader>dL',
        '<Cmd>Trouble workspace_diagnostics<CR>',
        desc = '[Trouble] workspace diagnostics',
      },
      {
        '<Leader>xd',
        '<Cmd>Trouble document_diagnostics<CR>',
        desc = '[Trouble] document diagnostics'
      },
      {
        '<Leader>xl',
        '<Cmd>Trouble loclist<CR>',
        desc = '[Trouble] loclist'
      },
      {
        '<Leader>xq',
        '<Cmd>Trouble quickfix<CR>',
        desc = '[Trouble] quickfix',
      },
      {
        'gR',
        '<Cmd>Trouble lsp_references<CR>',
        desc = '[Trouble] lsp references',
      },
    },
  },

  'mfussenegger/nvim-dap',

  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'mfussenegger/nvim-dap',
    config = function()
      require('config.nvim-dap')
    end,
  },

  {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
  },

  {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
      'sindrets/diffview.nvim',        -- optional
    },
    lazy = true,
    config = true,
    keys = {
      {
        '<Leader>gg',
        '<Cmd>Neogit<CR>',
        desc = 'Neogit',
      },
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end,
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('telescope').load_extension('file_browser')
    end,
    keys = {
      {
        '<Leader>ff',
        ':Telescope file_browser<CR>',
        desc = 'Telescope file browser',
      },
      {
        '<Leader>.',
        ':Telescope file_browser<CR>',
        desc = 'Telescope file browser',
      },
      {
        '<Leader>fb',
        ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
        desc = 'Telescope file browser in current buffer',
      },
    },
  },

  {
    'numToStr/Comment.nvim',
    config = true,
  },

  'windwp/nvim-ts-autotag',

  'famiu/bufdelete.nvim',

  {
    'caenrique/nvim-maximize-window-toggle',
    keys = {
      {
        '<Leader>wm',
        '<Cmd> ToggleOnly<CR>',
        desc = 'Maximize current window in a new tab',
      }
    }
  },

  {
    'windwp/nvim-spectre',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    keys = {
      {
        '<Leader>pS',
        '<Cmd>lua require("spectre").open()<CR>',
        desc = '[Spectre] open',
      },
      {
        '<Leader>sw',
        '<Cmd>lua require("spectre").open_visual({select_word=true})<CR>',
        desc = '[Spectre] open with current word',
      },
      {
        '<Leader>s',
        '<Esc>:lua require("spectre").open_visual()<CR>',
        mode = 'v',
        desc = '[Spectre] open with current selection',
      },
      {
        '<Leader>sf',
        'viw:lua require("spectre").open_file_search()<CR>',
        desc = '[Spectre] open current word in current buffer only',
      },
    },
  },

  'vim-scripts/ReplaceWithRegister',

  {
    'smjonas/live-command.nvim',
    config = function()
      require('live-command').setup({
        commands = {
          Norm = { cmd = 'norm' },
        },
      })
    end,
  },

  {
    'princejoogie/dir-telescope.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
      hidden            = true,
      respect_gitignore = true,
    },
  },

  {
    'ellisonleao/carbon-now.nvim',
    opts = {
      options = {
        theme = 'material',
        -- window_theme = 'none',
        font_family = 'Iosevka',
        -- font_size = '18px',
        -- bg = 'gray',
        -- line_numbers = true,
        -- line_height = '133%',
        -- drop_shadow = false,
        -- drop_shadow_offset_y = '20px',
        -- drop_shadow_blur = '68px',
        -- width = '680',
        -- watermark = false,
      },
    },

  },

  {
    'nvim-zh/colorful-winsep.nvim',
    opts = {
      -- highlight for Window separator
      highlight = {
        bg = '#24283B',
        fg = '#7AA2F7',
      },
      -- timer refresh rate
      interval = 30,
      -- This plugin will not be activated for filetype in the following table.
      no_exec_files = { 'packer', 'TelescopePrompt', 'mason', 'CompetiTest', 'NvimTree' },
      -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
      symbols = { '━', '┃', '┏', '┓', '┗', '┛' },
    }
  },

  {
    'shortcuts/no-neck-pain.nvim',
    version = '*'
  },

  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      'BufReadPre ~/Obsidian/**.md',
      'BufNewFile ~/Obsidian/**.md',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      disable_frontmatter = true,
      workspaces = {
        {
          name = 'personal',
          path = '~/Obsidian',
        },
      },
      completion = {
        prepend_note_id = false,
        use_path_only = true,
      },
      mappings = {
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ['<CR>'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
    },
    keys = {
      {
        '<Leader>nf',
        '<Cmd>ObsidianQuickSwitch<CR>'
      },
      {
        '<Leader>ns',
        '<Cmd>ObsidianSearch<CR>'
      },
    },
  },

  {
    'dhruvasagar/vim-table-mode',
    ft = 'markdown',
    config = function()
      vim.g.table_mode_always_active = 1

      vim.g.table_mode_disable_tableize_mappings = 1

      -- Causes issues
      -- vim.g.table_mode_disable_mappings = 1

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.cmd[[silent TableModeEnable]]
        end
      })
    end
  },

  {
    'kana/vim-textobj-line',
    dependencies = 'kana/vim-textobj-user'
  },

  {
    'anuvyklack/hydra.nvim',
    config = function()
      local Hydra = require('hydra')
      Hydra({
        name = 'Resize window',
        hint = false,
        mode = 'n',
        body = '<Leader>w',
        heads = {
          {
            '<', '<C-w><'
          },
          {
            '>', '<C-w>>'
          },
          {
            '+', '<C-w>+'
          },
          {
            '-', '<C-w>-'
          },
        }
      })
    end
  },

  -- langauge specific
  {
    'simrat39/rust-tools.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    ft = 'rust',
    config = function()
      require('config.rust-tools')
    end,
  },

  {
    'ray-x/go.nvim',
    dependencies = 'ray-x/guihua.lua',
    ft = 'go',
    config = function()
      require('config.go')
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    init = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown', 'vimwiki' },
    config = function()
      require('config.markdown-preview')
    end,
  },

  -- local plugins
  {
    'shadyalfred/electric-quotes.nvim',
    dependencies = 'uga-rosa/utf8.nvim',
    cmd = 'ElectricQuotesToggle',
    dev = true,
  },
}
