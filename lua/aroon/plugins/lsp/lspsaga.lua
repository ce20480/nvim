-- -- import lspsaga safely
-- local saga_status, saga = pcall(require, "lspsaga")
-- if not saga_status then
--   return
-- end
--
-- saga.setup({
--   -- keybinds for navigation in lspsaga window
--   scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
--   -- use enter to open file with definition preview
--   definition = {
--     edit = "<CR>",
--   },
--   ui = {
--     colors = {
--       normal_bg = "#022746",
--     },
--   },
-- })
-- OLD!!!

-- Upgrades:
-- Scrolling in Popups: The scrolling keybinds are set to mirror common conventions, making navigation in lspsaga popups intuitive.
-- UI Customizations: Adjusting the border_style and background color enhances the visual integration of lspsaga popups with your Neovim theme.
-- Check the latest lspsaga documentation for more UI options.
-- Diagnostic Source Display: Enabling the display of diagnostic sources helps identify which tool the diagnostic came from, improving clarity.
-- Code Action Visual Indicators: Configuring signs and virtual text for code actions makes it easier to spot where actions are available in your code.
-- Finder Configuration: Customizing action keys for the finder feature tailors navigation to your preferences, making it more efficient to use.
-- Rename and Hover Doc Customizations: Adjusting settings for rename prompts and hover doc dimensions can optimize these features for your workflow.
-- Keybindings: The keybindings for lspsaga actions are now set in the on_attach function of your LSP configuration, ensuring they're only active when an LSP server is attached.

-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- Keybinds for navigation in lspsaga popups
	scroll_preview = {
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	-- Use Enter to open the file from definition preview
	definition = {
		edit = "<CR>",
	},
	-- UI customization for lspsaga windows
	ui = {
		-- Customize the background color of lspsaga windows
		colors = {
			normal_bg = "#022746",
		},
		-- Example: Customize border style (check if this option is available in your lspsaga version)
		border_style = "rounded", -- Other options: "single", "double", "rounded", "bold"
	},
	-- Diagnostic source customization (if available in your version)
	diagnostic = {
		show_source = true, -- Show the source of diagnostics (e.g., Pyright, ESLint)
	},
	-- Code action keybinding customization
	code_action = {
		enable_keymaps = true, -- Enable default keymaps provided by lspsaga for code actions
		sign = true, -- Show sign for code action
		sign_priority = 40, -- Customize the priority of the code action sign
		virtual_text = true, -- Show virtual text for code actions
	},
	-- Customize the finder (e.g., references, definitions) appearance and behavior
	finder = {
		action_keys = {
			open = "<CR>", -- Key to open the selection
			vsplit = "<C-v>", -- Key to open the selection in a vertical split
			split = "<C-x>", -- Key to open the selection in a horizontal split
			quit = { "q", "<Esc>" }, -- Keys to close the finder window
			-- Add more actions as needed
		},
	},
	-- Rename customization
	rename = {
		-- Add options here, like prompt for the rename action
	},
	-- Hover doc customization
	hover_doc = {
		max_width = 80, -- Max width of hover doc popup
		max_height = 15, -- Max height of hover doc popup
		-- Adjust as needed for your screen size and preference
	},
	-- Additional configurations...
})

-- Note: For keybindings related to LSP actions using lspsaga, consider setting them in the 'on_attach' function
-- of your LSP configuration to ensure they're only active when an LSP server is attached.
