-- -- import comment plugin safely
-- local setup, comment = pcall(require, "Comment")
-- if not setup then
--   return
-- end
--
-- -- enable comment
-- comment.setup()

-- Enhancements:
-- Custom Keybindings: You can define custom key mappings if the default mappings don't fit your workflow or conflict with other keybindings you use.
-- Pre-hook and Post-hook Functions: Use pre-hook and post-hook functions to execute custom logic before or after commenting. This can be useful for integrating with other plugins or customizing the behavior based on the filetype or content.
-- Integrating with Treesitter: For even more precise comment toggling, especially in complex files with multiple languages (e.g., template files), you can enhance integration with Treesitter.

local status, comment = pcall(require, "Comment")
if not status then
	return
end

comment.setup({
	-- Enable integration with nvim-ts-context-commentstring if installed
	-- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),

	-- Example of custom keybindings
	toggler = {
		line = "gcc", -- Toggle comment for the current line
		block = "gbc", -- Toggle block comment for the selection
	},
	opleader = {
		line = "gc",
		block = "gb",
	},

	-- Additional configuration options can be set here
})
