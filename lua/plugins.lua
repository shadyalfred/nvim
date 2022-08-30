return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'Vonr/align.nvim'

  use 'NMAC427/guess-indent.nvim'

  use 'EdenEast/nightfox.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'nanozuki/tabby.nvim'

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'justinmk/vim-sneak'

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

  -- langauge specific
  use {
    'simrat39/rust-tools.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    }
  }

end)
