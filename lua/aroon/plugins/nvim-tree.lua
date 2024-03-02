-- -- import nvim-tree plugin safely
-- local setup, nvimtree = pcall(require, "nvim-tree")
-- if not setup then
-- 	return
-- end
--
-- -- recommended settings from nvim-tree documentation
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- -- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
--
-- -- configure nvim-tree
-- nvimtree.setup({
-- 	-- change folder arrow icons
-- 	renderer = {
-- 		icons = {
-- 			glyphs = {
-- 				folder = {
-- 					arrow_closed = "", -- arrow when folder is closed
-- 					arrow_open = "", -- arrow when folder is open
-- 				},
-- 			},
-- 		},
-- 	},
-- 	-- disable window_picker for
-- 	-- explorer to work well with
-- 	-- window splits
-- 	actions = {
-- 		open_file = {
-- 			window_picker = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- 	-- 	git = {
-- 	-- 		ignore = false,
-- 	-- 	},
-- })
--
-- -- open nvim-tree on setup
--
-- local function open_nvim_tree(data)
-- 	-- buffer is a [No Name]
-- 	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
--
-- 	-- buffer is a directory
-- 	local directory = vim.fn.isdirectory(data.file) == 1
--
-- 	if not no_name and not directory then
-- 		return
-- 	end
--
-- 	-- change to the directory
-- 	if directory then
-- 		vim.cmd.cd(data.file)
-- 	end
--
-- 	-- open the tree
-- 	require("nvim-tree.api").tree.open()
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Enhancements:
-- Icons Customization: Provides a more extensive set of default icons for different file types, making the file explorer visually informative.
-- Git Integration: Enables and configures Git features within nvim-tree, such as showing Git status icons next to files. The ignore option is set to false to show all files, including those ignored by Git, which can be toggled based on preference.
-- Diagnostics Integration: Enables diagnostics within nvim-tree, showing error, warning, info, and hint icons next to files. This requires Neovim's built-in LSP or another diagnostics source to be active.
-- Auto-Opening on VimEnter: Refines the auto-opening logic to work when Neovim is started without file arguments or with a directory as an argument. The nested = true option ensures that this autocmd can trigger other autocmds that might be necessary for the setup.
-- Update Focused File: Automatically updates the root of nvim-tree to the current file's directory when navigating files, enhancing the navigation experience.
-- Import nvim-tree plugin safely

local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- Disable default Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Customize folder arrow colors
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- Configure nvim-tree with additional options
nvimtree.setup({
	renderer = {
		-- Customize folder arrow icons and colors
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
			},
		},
	},
	-- Improved window split handling
	actions = {
		open_file = {
			resize_window = true,
			window_picker = {
				enable = false,
			},
		},
	},
	-- Enable Git integration
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	-- Other enhancements
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	filters = {
		dotfiles = false,
		custom = { ".git", "node_modules", ".cache" },
	},
})

-- Auto-open nvim-tree if opening Neovim with directory or in an empty buffer
vim.api.nvim_create_autocmd("VimEnter", {
	nested = true,
	callback = function()
		-- Open nvim-tree if Neovim is opened without file arguments
		if #vim.fn.argv() == 0 or vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
			require("nvim-tree.api").tree.toggle()
		end
	end,
})
