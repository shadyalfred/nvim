return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'tpope/vim-repeat'
  use 'Vonr/align.nvim'

  use {
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
      require('nvim-surround').setup()
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'text', 'markdown', },
        disable_in_macro = true,
        disable_in_visualblock = true
      })
    end
  }

  use 'NMAC427/guess-indent.nvim'

  use 'folke/tokyonight.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'nanozuki/tabby.nvim'

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    'nvim-telescope/telescope-media-files.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  }

  use {
    'folke/flash.nvim',
    config = function()
      require('config.flash')
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
  }

  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-jdtls'

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip'
    }
  }

  use {
    'hrsh7th/vim-vsnip',
    requires =  {
      'hrsh7th/vim-vsnip-integ',
      'rafamadriz/friendly-snippets',
    }
  }

  use 'onsails/lspkind.nvim'

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  } 

  use 'mfussenegger/nvim-dap'

  use {
    'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap' }
  }

  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
      'sindrets/diffview.nvim',        -- optional
    },
    config = function()
      require('config.neogit')
    end
  }

  use 'lewis6991/gitsigns.nvim'

  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('config.telescope-file-browser')
    end
  }

  use 'numToStr/Comment.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'windwp/nvim-ts-autotag'

  use {
    'nvim-treesitter/nvim-treesitter-context',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async'
  }

  use 'famiu/bufdelete.nvim'

  use 'caenrique/nvim-maximize-window-toggle'

  use {
    'windwp/nvim-spectre',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons'
    }
  }

  use 'vim-scripts/ReplaceWithRegister'

  use {
    'smjonas/live-command.nvim',
    config = function()
      require('live-command').setup {
        commands = {
          Norm = { cmd = 'norm' },
        },
      }
    end,
  }

  use({
    'princejoogie/dir-telescope.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('dir-telescope').setup({
        hidden = true,
        respect_gitignore = true,
      })
    end,
  })

  use {
    'RishabhRD/nvim-cheat.sh',
    requires =  'RishabhRD/popfix'
  }

  use 'ellisonleao/carbon-now.nvim'

  use 'nvim-zh/colorful-winsep.nvim'

  use {
    'shortcuts/no-neck-pain.nvim',
    tag = '*'
  }

  use {
    'vimwiki/vimwiki',
    config = function()
      require('config.vimwiki')
    end
  }

  use 'godlygeek/tabular'

  use {
    'mcookly/rosetta.nvim',
    config = function()
      require('rosetta').setup({
        keyboard = {
          enabled = false,
        },
      })
    end
  }

  use {
    'kana/vim-textobj-line',
    requires = 'kana/vim-textobj-user'
  }

  -- langauge specific
  use {
    'simrat39/rust-tools.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    }
  }

  use {
    'ray-x/go.nvim',
    requires = 'ray-x/guihua.lua'
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown' },
  }
end)
