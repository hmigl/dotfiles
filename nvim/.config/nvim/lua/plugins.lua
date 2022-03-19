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
  use ("wbthomason/packer.nvim")
  use ({ "kyazdani42/nvim-tree.lua", config = get_setup("tree") })
  use ({
	  "nvim-lualine/lualine.nvim", config = get_setup("lualine"),
	  requires = { "kyazdani42/nvim-web-devicons", opt = true }
  	})

  -- colorschemes
  use ("cocopon/iceberg.vim")
  use ("folke/tokyonight.nvim")
  use ("lunarvim/darkplus.nvim")

  -- nvim-cmp
  use ({
	  "hrsh7th/nvim-cmp", -- completion plugin
	  requires = {
		  { "hrsh7th/cmp-buffer" },
		  { "hrsh7th/cmp-path" },
		  { "hrsh7th/cmp-cmdline" },
		  { "L3MON4D3/LuaSnip" }, -- snippet engine
		  { "saadparwaiz1/cmp_luasnip" },
		  { "hrsh7th/cmp-nvim-lsp" }, -- provides lsp completions
	  },
	  config = get_setup("cmp"),
  })

  -- telescope
  use ({
	  "nvim-telescope/telescope.nvim", -- fuzzy finder
	  requires = {
		  { "nvim-lua/plenary.nvim" },
		  { "nvim-lua/popup.nvim" },
	  },
	  --config = get_setup("telescope"),
  })

  -- LSP
  use ("neovim/nvim-lspconfig")
  use ("williamboman/nvim-lsp-installer")

  -- Treesitter
  use ({
	  "nvim-treesitter/nvim-treesitter",
	  config = get_setup("treesitter"),
	  run = ":TSUpdate",
  })
  use ("p00f/nvim-ts-rainbow")
  use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = get_setup("autopairs"),
    })

  use({
	  "akinsho/toggleterm.nvim",
	  config = get_setup("toggleterm"),
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

