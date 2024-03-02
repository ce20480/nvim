-- -- import nvim-treesitter plugin safely
-- local status, treesitter = pcall(require, "nvim-treesitter.configs")
-- if not status then
--   return
-- end
--
-- -- configure treesitter
-- treesitter.setup({
--   -- enable syntax highlighting
--   highlight = {
--     enable = true,
--   },
--   -- enable indentation
--   indent = { enable = true },
--   -- enable autotagging (w/ nvim-ts-autotag plugin)
--   autotag = { enable = true },
--   -- ensure these language parsers are installed
--   ensure_installed = {
--     "json",
--     "javascript",
--     "typescript",
--     "tsx",
--     "yaml",
--     "html",
--     "css",
--     "markdown",
--     "markdown_inline",
--     "svelte",
--     "graphql",
--     "bash",
--     "lua",
--     "vim",
--     "dockerfile",
--     "gitignore",
--   },
--   -- auto install above language parsers
--   auto_install = true,
-- })

-- Enhancements:
-- ensure_installed = "all": Automatically installs parsers for all supported languages. While convenient, you might prefer specifying a subset of languages to speed up installation times or manage resources better.
-- rainbow Module: Requires the nvim-ts-rainbow plugin and enables rainbow parentheses for easier identification of matching delimiters. It's configured to work in extended mode for a broader range of delimiters beyond just parentheses.
-- context_commentstring Module: Integrated with the nvim-ts-context-commentstring plugin, this configuration allows for context-aware commenting, especially useful in files that mix languages or markups, like Vue or Svelte components.
-- treesitter-context Setup: While not a direct part of the nvim-treesitter.configs setup, the treesitter-context plugin (if you choose to use it) provides a persistent display of the context around the cursor in the file, which can be especially helpful in deeply nested code.

-- Import nvim-treesitter configurations safely
local status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- Configure Treesitter with additional options and modules
treesitter_configs.setup({
	highlight = {
		enable = true, -- Enable Treesitter-based syntax highlighting
		additional_vim_regex_highlighting = false, -- Reduce reliance on Vim regex highlighting
	},
	indent = {
		enable = true, -- Enable Treesitter-based indentation
	},
	autotag = {
		enable = true, -- Requires nvim-ts-autotag plugin for HTML/XML autotagging
	},
	ensure_installed = "all", -- Automatically install all available language parsers
	-- Or specify a subset of languages to ensure are installed
	-- ensure_installed = { "json", "javascript", "typescript", "tsx", "yaml", "html", "css", "lua", "vim" },
	auto_install = true, -- Automatically install missing parsers when opening files
	-- Add additional Treesitter modules here
	rainbow = {
		enable = true, -- Requires p00f/nvim-ts-rainbow plugin
		extended_mode = true, -- Highlight also non-parentheses delimiters
		max_file_lines = nil, -- Do not enable for files with more than n lines, nil disables the limit
	},
	context_commentstring = {
		enable = true, -- Requires JoosepAlviste/nvim-ts-context-commentstring plugin
		enable_autocmd = false, -- Disable automatic context detection
	},
	-- Additional plugins and configurations can be added here
})

-- Example for setting up a module not directly related to a Treesitter configuration
require("treesitter-context").setup({
	enable = true, -- Show code context at the top of the window
	-- Additional context options...
})
