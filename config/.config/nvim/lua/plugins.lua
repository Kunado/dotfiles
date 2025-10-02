local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd.packadd 'packer.nvim'

packer.startup(function(use)
  -- package manager
  use 'wbthomason/packer.nvim'

  use 'folke/noice.nvim'
  use 'MunifTanjim/nui.nvim'

  -- status line
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'fatih/vim-go', opt = true, ft = { 'go' } }

  -- bufferline
  use 'akinsho/nvim-bufferline.lua'

  -- autoclose
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- fuzzy finder
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- color scheme
  use 'folke/tokyonight.nvim'
  use 'EdenEast/nightfox.nvim'
  --[[use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }]]
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'glepnir/lspsaga.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'

  -- doc
  use 'vim-jp/vimdoc-ja'

  use 'github/copilot.vim'
end)
