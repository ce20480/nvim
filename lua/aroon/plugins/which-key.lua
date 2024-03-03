local status, which_key = pcall(require, "which-key")
if not status then
	return
end

which_key.setup({
	-- Your configuration here
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- Other plugin options...
	},
	presets = {
		operators = false, -- disable operators like d, y, ... (false by default)
	},
	show_help = true, -- show help message on the command line when the pop-up is visible
	triggers = "auto", -- automatically setup triggers
	triggers_blacklist = {
		-- list of mode / prefixes that should never trigger which-key
		i = { "j", "k" },
		v = { "j", "k" },
	},
	window = {
		border = "rounded", -- none, single, double, rounded, solid, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	-- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_keys = false, -- show keys in addition to their labels
	-- more options...-- More which-key setup options...
})
-- if you want to change what keys do what for which_key, you can do so here:
-- which_key.register({
-- 	f = {
-- 		name = "+file", -- group name
-- 		f = { "<cmd>Telescope find_files<cr>", "Find File" },
-- 		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
-- 		n = { "<cmd>enew<cr>", "New File" }, -- set a single command and text
-- 	},
-- 	b = {
-- 		name = "+buffer",
-- 		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
-- 		n = { "<cmd>bnext<cr>", "Next Buffer" },
-- 		p = { "<cmd>bprevious<cr>", "Previous Buffer" },
-- 	},
-- }, { prefix = "<leader>" })
