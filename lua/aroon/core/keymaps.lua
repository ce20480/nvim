-- -- set leader key to space
-- vim.g.mapleader = " "
--
-- local keymap = vim.keymap -- for conciseness
--
-- ---------------------
-- -- General Keymaps
-- ---------------------
--
-- -- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>")
--
-- -- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>")
--
-- -- delete single character without copying into register
-- keymap.set("n", "x", '"_x')
--
-- -- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>") -- increment
-- keymap.set("n", "<leader>-", "<C-x>") -- decrement
--
-- -- window management
-- keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
--
-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
--
-- -- movement mine
-- keymap.set("n", "k", "kzz") --  go up and centre
-- keymap.set("n", "j", "jzz") --  go down and centre
-- keymap.set("n", "<C-u>", "<C-u>zz") --  go up a lot and centre
-- keymap.set("n", "<C-d>", "<C-d>zz") --  go down a lot and centre
--
-- ----------------------
-- -- Plugin Keybinds
-- ----------------------
--
-- -- vim-maximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization
--
-- -- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
--
-- -- telescope
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
-- keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
--
-- -- telescope git commands (not on youtube nvim video)
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
--
-- -- restart lsp server (not on youtube nvim video)
-- keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
-- OLD!!!!

-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use 'jk' to exit insert mode quickly
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Clear search highlights with a quick leader command
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- Delete a single character without affecting the clipboard
keymap.set("n", "x", '"_x', { desc = "Delete char without yank" })

-- Increment/decrement numbers with leader commands
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Window management shortcuts for splitting and closing
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window dimensions" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current window" })

-- Tab management for easier navigation
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

-- Enhanced movement, keeping the cursor centered
keymap.set("n", "k", "kzz", { desc = "Move up and center" })
keymap.set("n", "j", "jzz", { desc = "Move down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })

----------------------
-- Plugin Keybinds (Conditional)
----------------------

-- Check if the plugin is available before setting keymaps
local function set_plugin_keymaps()
	-- vim-maximizer
	keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle window maximization" })

	-- nvim-tree
	if pcall(require, "nvim-tree") then
		keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
	end

	-- telescope
	if pcall(require, "telescope") then
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Telescope find string under cursor" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope list buffers" })
		keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope help tags" })
		-- Additional Telescope git mappings
		keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Telescope git commits" })
		keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { desc = "Telescope git file commits" })
		keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Telescope git branches" })
		keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Telescope git status" })
	end

	-- Restart LSP server
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP server" })
end

set_plugin_keymaps()
