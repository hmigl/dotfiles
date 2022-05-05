local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
   packer_bootstrap = fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path})
end

function get_setup(name)
   return string.format('require("setup/%s")', name)
end

return require('packer').startup(function(use)
   -- My plugins here

   -- Packer can manage itself
   use 'wbthomason/packer.nvim'

   -- LSP
   use 'neovim/nvim-lspconfig'

   -- Telescope
   use {
      'nvim-telescope/telescope.nvim', -- fuzzy finder
       requires = {
          { 'nvim-lua/plenary.nvim' },
          { 'nvim-lua/popup.nvim' },
       },
      config = get_setup("telescope"),
    }

   -- Treesitter
   use {
      'nvim-treesitter/nvim-treesitter',
      config = get_setup("treesitter"),
      run = ':TSUpdate',
   }
   use 'p00f/nvim-ts-rainbow'

   -- Cmp
   use {
      'hrsh7th/nvim-cmp',
      requires = {
         { 'hrsh7th/cmp-buffer' },
         { 'hrsh7th/cmp-path' },
         { 'hrsh7th/cmp-cmdline' },
         { 'L3MON4D3/LuaSnip' },
         { 'rafamadriz/friendly-snippets' },
         { 'saadparwaiz1/cmp_luasnip' },
         { 'hrsh7th/cmp-nvim-lsp' },
      },
      config = get_setup("cmp"),
   }

   use {
      'windwp/nvim-autopairs',
      after = "nvim-cmp",
      config = get_setup("autopairs"),
   }

   use {
      'nvim-lualine/lualine.nvim', config = get_setup("lualine"),
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   }

   use {
      'norcalli/nvim-colorizer.lua',
      config = get_setup("colorizer")
   }

   use 'tpope/vim-surround'
   use 'tpope/vim-commentary'

   -- Colorschemes
   use 'lunarvim/darkplus.nvim'
   use 'morhetz/gruvbox'

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if packer_bootstrap then
      require('packer').sync()
   end
end)

