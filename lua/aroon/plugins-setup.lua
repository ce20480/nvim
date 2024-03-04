-- Installation using packer
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

-- set mapleader
vim.g.mapleader = " "
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

	-- gitsigns.nvim for Git signs and more
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "<leader>gn", function()
						gs.next_hunk()
					end)
					map("n", "<leader>gp", function()
						gs.prev_hunk()
					end)

					-- Actions
					map("n", "<leader>hs", function()
						gs.stage_hunk()
					end)
					map("n", "<leader>hr", function()
						gs.reset_hunk()
					end)
					map("v", "<leader>hs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("n", "<leader>hS", gs.stage_buffer)
					map("n", "<leader>hu", gs.undo_stage_hunk)
					map("n", "<leader>hR", gs.reset_buffer)
					map("n", "<leader>hp", gs.preview_hunk)
					map("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end)
					map("n", "<leader>tb", gs.toggle_current_line_blame)
					map("n", "<leader>hd", gs.diffthis)
					map("n", "<leader>hD", function()
						gs.diffthis("~")
					end)
					map("n", "<leader>td", gs.toggle_deleted)

					-- ... Add more mappings as needed
				end,
			})
		end,
	})

	-- fugitive git integration
	use({
		"tpope/vim-fugitive",
		cmd = {
			"Gstatus",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Glog",
			"Gedit",
		},
		requires = { "tpope/vim-rhubarb" }, -- Optional: for GitHub integration
		config = function()
			-- Open Git status in a new split
			vim.api.nvim_set_keymap("n", "<leader>gS", ":Git<CR>", { noremap = true, silent = true })

			-- Add one file at a time to staging
			vim.api.nvim_set_keymap("n", "<leader>ga", ":Git add %<CR>", { noremap = true, silent = true })

			-- Add one file at a time to staging
			-- vim.api.nvim_set_keymap("n", "<leader>gu", ":Git reset HEAD -- %<CR>", { noremap = true, silent = true })
			--
			-- -- Add files to staging
			-- vim.api.nvim_set_keymap("n", "<leader>gA", ":Git add .<CR>", { noremap = true, silent = true })
			--
			-- -- Commit changes with a prompt for commit message
			-- vim.api.nvim_set_keymap("n", "<leader>gC", ":Git commit<CR>", { noremap = true, silent = true })
			--
			-- -- Push changes to the remote repository
			-- vim.api.nvim_set_keymap("n", "<leader>gP", ":Git push<CR>", { noremap = true, silent = true })
			--
			-- -- Pull changes from the remote repository
			-- vim.api.nvim_set_keymap("n", "<leader>gL", ":Git pull<CR>", { noremap = true, silent = true })
			--
			-- -- Open Git diff for the current file
			-- vim.api.nvim_set_keymap("n", "<leader>gD", ":Gdiffsplit<CR>", { noremap = true, silent = true })
			--
			-- -- Browse repository files
			-- vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })
		end,
	})
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
-- This is beginning for lazy loading plugins, attempt to lazy load all plugins
-- Install lazylazy
-- local lazypath = vim.fn.stdpath("data") .. "/site/pack/lazy/start/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
-- 	vim.fn.system({
-- 		"git",
-- 		"clone",
-- 		"--filter=blob:none",
-- 		"https://github.com/folke/lazy.nvim.git",
-- 		"--branch=stable", -- latest stable release
-- 		lazypath,
-- 	})
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- -- Lazy loading configuration
-- require("lazy").setup({
-- 	-- Packer can manage itself
-- 	{ "wbthomason/packer.nvim" },
--
-- 	-- Essential utilities
-- 	{ "nvim-lua/plenary.nvim" },
-- 	{ "nvim-lua/popup.nvim" },
--
-- 	-- UI Enhancements
-- 	{ "bluz71/vim-nightfly-guicolors", event = "VimEnter" },
-- 	{ "kyazdani42/nvim-web-devicons", event = "VimEnter" }, -- Dependency for several plugins requiring icons
-- 	{
-- 		"nvim-lualine/lualine.nvim",
-- 		event = "VimEnter",
-- 		config = function()
-- 			require("lualine").setup()
-- 		end,
-- 	},
--
-- 	-- Navigation
-- 	{ "christoomey/vim-tmux-navigator", event = "VimEnter" },
--
-- 	-- Editing Enhancements
-- 	{ "tpope/vim-surround", keys = { "c", "d", "y" } },
-- 	{
-- 		"numToStr/Comment.nvim",
-- 		keys = { "gc", "gb" },
-- 		config = function()
-- 			require("Comment").setup()
-- 		end,
-- 	},
--
-- 	-- File and Project Navigation
-- 	{ "nvim-tree/nvim-tree.lua", cmd = "NvimTreeToggle", requires = "nvim-tree/nvim-web-devicons" },
--
-- 	-- Telescope and Extensions
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		cmd = "Telescope",
-- 		requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
-- 	},
--
-- 	-- LSP, Autocompletion, and Snippets
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		"williamboman/mason.nvim",
-- 		"williamboman/mason-lspconfig.nvim",
-- 		"hrsh7th/nvim-cmp",
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"hrsh7th/cmp-buffer",
-- 		"hrsh7th/cmp-path",
-- 		"L3MON4D3/LuaSnip",
-- 		"saadparwaiz1/cmp_luasnip",
-- 		"rafamadriz/friendly-snippets",
-- 		event = "BufReadPre",
-- 		config = function()
-- 			require("user.lsp") -- Assuming you have an LSP config file in 'user/lsp.lua'
-- 		end,
-- 	},
--
-- 	-- Treesitter for improved syntax highlighting
-- 	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", event = "BufRead" },
--
-- 	-- Git integration
-- 	{ "lewis6991/gitsigns.nvim", event = "BufRead" },
--
-- 	-- Which-key integration
-- 	{
-- 		"folke/which-key.nvim",
-- 		keys = " ",
-- 		config = function()
-- 			require("which-key").setup()
-- 		end,
-- 	},
-- })
