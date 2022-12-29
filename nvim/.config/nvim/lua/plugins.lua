-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

-- Easy way to attribute configs to a plugin
function get_setup(name)
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

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' }, config = get_setup('telescope'), }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = get_setup('treesitter'),
  }

  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

  use 'tpope/vim-surround' -- Easily surround text objects

  -- Add indentation guides even on blank lines
  use { 'lukas-reineke/indent-blankline.nvim', config = get_setup('indent_blankline'), }

  -- Colorshcemes
  use 'morhetz/gruvbox'
  use 'tomasiser/vim-code-dark'
  use 'folke/tokyonight.nvim'

  if is_bootstrap then
    require('packer').sync()
  end
end)
