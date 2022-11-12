return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'Vonr/align.nvim'

  use 'NMAC427/guess-indent.nvim'

  use 'folke/tokyonight.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'nanozuki/tabby.nvim'

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

  use 'justinmk/vim-sneak'
  use 'easymotion/vim-easymotion'

  use {
    'kyazdani42/nvim-tree.lua',
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

  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  use 'lewis6991/gitsigns.nvim'

  use {
    'X3eRo0/dired.nvim',
    requires = 'MunifTanjim/nui.nvim'
  }

  use {
    'numToStr/Comment.nvim',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  use {
    'nvim-orgmode/orgmode'
  }

  use {
    'famiu/bufdelete.nvim'
  }

  use {
    'cohama/lexima.vim'
  }

  use {
    'caenrique/nvim-maximize-window-toggle'
  }

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
