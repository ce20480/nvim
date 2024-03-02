-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	return
end

-- Enhancements:
-- Custom Signs: This example configures custom signs for various git changes (e.g., added, modified, and deleted lines) to make them more visually distinctive or to match personal preferences.
-- Line Highlights and Number Highlights: Demonstrates how to toggle line and number highlighting for changes. Set numhl and linehl to true if you prefer these highlights.
-- Keymaps Configuration: Provides a placeholder for customizing keymaps. You can define your own shortcuts for navigating and interacting with git hunks.
-- Git Directory Watching: Adjusts the interval for watching the git directory for changes and enables file tracking.
-- Current Line Blame: Enables inline git blame information showing the author, date, and commit summary for the current line, with customization options for the display format and delay before showing.

-- Configure/enable gitsigns with additional options
gitsigns.setup({
	signs = {
		add = { text = "+" }, -- Change sign for added lines
		change = { text = "~" }, -- Change sign for modified lines
		delete = { text = "_" }, -- Change sign for deleted lines
		topdelete = { text = "‾" }, -- Change sign for top delete lines
		changedelete = { text = "~" }, -- Change sign for changed lines that are deleted
	},
	numhl = false, -- Toggle line number highlighting for changes
	linehl = false, -- Toggle line highlighting for changes
	-- keymaps = { -- Apparently it is unrecognised in the current version
	-- Default keymaps are fine, but you can customize them here
	-- Example: ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
	-- },
	watch_gitdir = {
		interval = 1000, -- Sets the git directory watch interval in milliseconds
		follow_files = true, -- Automatically track file changes in git
	},
	current_line_blame = true, -- Toggle git blame for the current line
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- Position of virtual text at end of line
		delay = 1000, -- Delay for showing the current line blame
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	-- More configurations can be added as needed
})
