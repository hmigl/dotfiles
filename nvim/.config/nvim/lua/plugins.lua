-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

-- Easy way to attribute configs to a plugin
local function get_setup(name)
  return string.format('require("setup/%s")', name)
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path', 'rafamadriz/friendly-snippets',
    },
    config = get_setup('nvim_cmp'),
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' }, config = get_setup('telescope'), }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    requires = { 'p00f/nvim-ts-rainbow', 'nvim-treesitter/nvim-treesitter-textobjects' },
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = get_setup('treesitter'),
  }

  -- Inject LSP diagnostics, formatters, and more
  use { 'jose-elias-alvarez/null-ls.nvim', config = get_setup('null_ls') }

  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

  use 'tpope/vim-surround' -- Easily surround text objects

  use { 'windwp/nvim-autopairs', config = get_setup('autopairs') } -- Auto closing

  -- Add indentation guides even on blank lines
  use { 'lukas-reineke/indent-blankline.nvim', config = get_setup('indent_blankline'), }

  use { -- Cool status line
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = get_setup('lualine'),
  }

  -- 42
  use {
    '42Paris/42header',
    config = function()
      vim.cmd [[
      let g:user42 = 'hmigl'
      let g:mail42 = 'hmigl@student.42sp.org.br'
      ]]
    end,
  }

  use { 'mbbill/undotree', config = get_setup('undotree') }

  -- Colorshcemes
  use 'morhetz/gruvbox'
  use 'tomasiser/vim-code-dark'
  use 'folke/tokyonight.nvim'
  use 'rose-pine/neovim'

  if is_bootstrap then
    require('packer').sync()
  end
end)
