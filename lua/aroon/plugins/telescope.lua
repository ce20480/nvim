-- -- import telescope plugin safely
-- local telescope_setup, telescope = pcall(require, "telescope")
-- if not telescope_setup then
--   return
-- end
--
-- -- import telescope actions safely
-- local actions_setup, actions = pcall(require, "telescope.actions")
-- if not actions_setup then
--   return
-- end
--
-- -- configure telescope
-- telescope.setup({
--   -- configure custom mappings
--   defaults = {
--     mappings = {
--       i = {
--         ["<C-k>"] = actions.move_selection_previous, -- move to prev result
--         ["<C-j>"] = actions.move_selection_next, -- move to next result
--         ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
--       },
--     },
--   },
-- })
--
-- telescope.load_extension("fzf")

-- Enhancements
-- Additional Keybindings: Demonstrates how to disable a default key mapping and add custom keybindings in both insert (i) and normal (n) mode, offering a more personalized interaction with Telescope prompts.
-- File Ignore Patterns: Specifies patterns for files and directories that Telescope should ignore, improving search performance and relevancy.
-- Layout Configuration: Adjusts the layout strategy and configuration for Telescope windows, providing flexibility in how search results and previews are displayed.
-- Picker Configurations: Customizes specific pickers like find_files with themes or other settings, allowing for per-picker customization.
-- Extension Configurations: Details how to configure extensions such as fzf, enhancing the fuzzy finding capabilities and integrating them more deeply into the sorting process.
-- Preview Enhancements: Enables Treesitter-based previews for supported file types, offering syntax-highlighted previews in the search results.

-- Import telescope and actions safely
local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
	return
end

-- Configure Telescope
telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send to QFL and open QFL
				["<C-x>"] = false, -- Example: Disable a default key mapping
			},
			n = {
				["<C-c>"] = actions.close, -- Close with Ctrl-C in normal mode
			},
		},
		file_ignore_patterns = { "node_modules", "%.git/", "dist/" }, -- Ignore certain files/patterns
		layout_strategy = "flex", -- Use the 'flex' layout strategy
		layout_config = {
			horizontal = {
				mirror = false,
				preview_width = 0.6,
			},
			vertical = {
				mirror = false,
			},
		},
		-- Enable preview with Ctrl-p in insert mode
		preview = {
			treesitter = true,
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown", -- Use the dropdown theme for find_files
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- Enable fuzzy finding
			override_generic_sorter = true, -- Override the generic sorter
			override_file_sorter = true, -- Override the file sorter
		},
	},
})

-- Load extensions
telescope.load_extension("fzf")

-- Additional extensions can be loaded here
