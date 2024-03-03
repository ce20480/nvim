-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- GitHub Copilot plugin
	-- use("github/copilot.vim")--  do not need because I have pulled the plugin from the official repo and add it to its on pack folder

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Add nvim-treesitter-context plugin here
	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = "nvim-treesitter/nvim-treesitter", -- Make sure to load after nvim-treesitter
		config = function()
			require("treesitter-context").setup({
				-- Add your configuration here
			})
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- which-key.nvim
	use({ "folke/which-key.nvim" })
	-- 	config = function()
	-- 		local status_ok, which_key = pcall(require, "plugins.which-key")
	-- 		if not status_ok then
	-- 			print("Failed to load which-key")
	-- 			return
	-- 		end
	-- 		which_key.setup({
	-- 			-- Your setup here
	-- 		})
	-- 	end,
	-- })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
--
-- This is beginning for lazy loading plugins
-- return require("packer").startup(function(use)
-- 	use({ "wbthomason/packer.nvim" })
-- 	use({ "nvim-lua/plenary.nvim" })
--
-- 	-- Lazy load themes, only when a colorscheme command is issued
-- 	use({ "bluz71/vim-nightfly-guicolors", opt = true, cmd = { "colorscheme nightfly" } })
--
-- 	-- Lazy load tmux navigator only if tmux is detected
-- 	use({
-- 		"christoomey/vim-tmux-navigator",
-- 		cond = function()
-- 			return vim.env.TMUX
-- 		end,
-- 	})
--
-- 	-- Maximizer can be lazy loaded on its command
-- 	use({ "szw/vim-maximizer", cmd = "MaximizerToggle" })
--
-- 	-- Surround and register plugins are essential but don't need to be loaded immediately
-- 	use({ "tpope/vim-surround", keys = { "c", "d", "y" } })
-- 	use({ "inkarkat/vim-ReplaceWithRegister", keys = { "gr" } })
--
-- 	-- Commenting
-- 	use({
-- 		"numToStr/Comment.nvim",
-- 		keys = { "gc", "gb" },
-- 		config = function()
-- 			require("Comment").setup()
-- 		end,
-- 	})
--
-- 	-- File explorer
-- 	use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons", cmd = "NvimTreeToggle" })
--
-- 	-- Status line
-- 	use({ "nvim-lualine/lualine.nvim", event = "VimEnter" })
--
-- 	-- Telescope and its extensions
-- 	use({
-- 		"nvim-telescope/telescope.nvim",
-- 		requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
-- 		cmd = "Telescope",
-- 	})
--
-- 	-- Autocompletion and snippets
-- 	use({
-- 		"hrsh7th/nvim-cmp",
-- 		requires = {
-- 			"hrsh7th/cmp-nvim-lsp",
-- 			"hrsh7th/cmp-buffer",
-- 			"hrsh7th/cmp-path",
-- 			"saadparwaiz1/cmp_luasnip",
-- 			"L3MON4D3/LuaSnip",
-- 			"rafamadriz/friendly-snippets",
-- 		},
-- 		event = "InsertEnter",
-- 	})
--
-- 	-- LSP, formatting, and linting
-- 	use({
-- 		"neovim/nvim-lspconfig",
-- 		"williamboman/mason.nvim",
-- 		"williamboman/mason-lspconfig.nvim",
-- 		"jose-elias-alvarez/null-ls.nvim",
-- 		event = "BufReadPre",
-- 	})
--
-- 	-- Treesitter for improved syntax highlighting
-- 	use({
-- 		"nvim-treesitter/nvim-treesitter",
-- 		run = ":TSUpdate",
-- 		event = "BufRead",
-- 		config = function()
-- 			require("nvim-treesitter.configs").setup({ highlight = { enable = true }, indent = { enable = true } })
-- 		end,
-- 	})
--
-- 	-- Treesitter context for showing the current function/class context at the top
-- 	use({
-- 		"nvim-treesitter/nvim-treesitter-context",
-- 		after = "nvim-treesitter",
-- 		config = function()
-- 			require("treesitter-context").setup()
-- 		end,
-- 	})
--
-- 	-- Git integration
-- 	use({ "lewis6991/gitsigns.nvim", event = "BufRead" })
--
-- 	-- Check if packer needs to install plugins on first run
-- 	if packer_bootstrap then
-- 		require("packer").sync()
-- 	end
-- end)
