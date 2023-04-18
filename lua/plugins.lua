local fn = vim.fn

-- Automatically install packer:
-- Firstly specifying the path of packer.nvim data directory
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- where we also run PackerSync
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call(pccall) so we don't error out on first use of packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- if we have Have packer use a popup window for that we have to install the plugins 'popup.nvim'
-- https://github.com/wbthomason/packer.nvim#using-a-floating-window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Now bellow code we will use all the required plugins
return packer.startup(function(use)
	-- Using these plugins here so that we can require it latter
	-- Packer
	use("wbthomason/packer.nvim") -- Have packer manager itself

    use ("nvim-lua/popup.nvim") -- An Implementation of the Popup API from vim in NeoVim

	-- Common utilities
	use("nvim-lua/plenary.nvim") -- Useful lua functions used in lot's of other plugins

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Colorschema/Theme
	use("rebelot/kanagawa.nvim") 
	
	use ("moll/vim-bbye")

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("configs.lualine")
			-- seperating the config to a different file './lua/configs/lualine.lua' & then requiring it here
		end,
		requires = { "nvim-web-devicons" },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("configs.treesitter")
		end,
	})

	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- LSP
	 use("neovim/nvim-lspconfig")-- This plugin will Enable LSP
      -- Mason: Portable package manager
	 use("williamboman/mason.nvim") -- Simple to use Language Server Installer
	 use("williamboman/mason-lspconfig.nvim") -- Simple to use Language Server Installer

	-- LSP diagnostics, code actions, and more via Lua.
	--use({
	--    "jose-elias-alvarez/null-ls.nvim",
	--	requires = { "nvim-lua/plenary.nvim" },
	--})



	 use("onsails/lspkind-nvim")
	-- Cmp: Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
	}) -- The completions plugin
	use("hrsh7th/cmp-nvim-lsp") 
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" }) -- Path Completions
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" }) -- Buffer completions
    use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" }) -- Command line completions
    use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }) -- Snippets Completions
    -- Github Copilot
    use({"github/copilot.vim", after = "nvim-cmp"})
    -- Snippets
    use ({"L3MON4D3/LuaSnip", after="nvim-cmp"}) --snippet engine
    use ({"rafamadriz/friendly-snippets", after="nvim-cmp"}) -- a bunch of snippets to use


	-- File manager
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({"*"})
		end,
	})

	-- Show colors
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("configs.toggleterm")
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	})

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	})

	-- Background Transparent
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("configs.transparent")
    end, 
  })
	
  -- For bufferline
  use({
	"akinsho/nvim-bufferline.lua",
	tag = "v3.*",
	-- requires = "kyazdani42/nvim-web-devicons",
	requires = "nvim-tree/nvim-web-devicons", -- for now we will use 'nvim-tree/nvim-web-devicons' instead of 'kyazdani42/nvim-web-devicons' icon
	config = function()
	  require("configs.bufferline")
	end,
  })
end)
