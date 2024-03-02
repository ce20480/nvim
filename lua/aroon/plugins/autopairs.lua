-- -- import nvim-autopairs safely
-- local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
-- if not autopairs_setup then
--   return
-- end
--
-- -- configure autopairs
-- autopairs.setup({
--   check_ts = true, -- enable treesitter
--   ts_config = {
--     lua = { "string" }, -- don't add pairs in lua string treesitter nodes
--     javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
--     java = false, -- don't check treesitter on java
--   },
-- })
--
-- -- import nvim-autopairs completion functionality safely
-- local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
-- if not cmp_autopairs_setup then
--   return
-- end
--
-- -- import nvim-cmp plugin safely (completions plugin)
-- local cmp_setup, cmp = pcall(require, "cmp")
-- if not cmp_setup then
--   return
-- end
--
-- -- make autopairs and completion work together
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Improvements:
-- Clear Naming and Return Early Pattern: Uses clear variable names for indicating success status and returned modules. The pattern of checking the success status and returning early if a required module isn't available is a best practice for clean code.
-- Disabling in Specific Filetypes: Added an example of how to disable auto-pairs in specific filetypes where you might not want them, such as TelescopePrompt and Vim configuration files (vim). Adjust the disable_filetype list based on your preferences.
-- Fast Wrap Configuration Placeholder: Included a placeholder for fast_wrap settings, which allows you to configure mappings for quickly wrapping text in pairs. This feature can be highly productive, and you can customize it to fit your workflow.
-- Integration with nvim-cmp Enhanced: The integration with nvim-cmp for completing pairs on confirmation is maintained, with an example of how to customize behavior for specific filetypes through map_char.
-- Comments for Clarity: Added comments to explain the purpose of configurations and placeholders for potential customizations, making the script more understandable and maintainable.

-- Import nvim-autopairs safely
local status_autopairs, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_autopairs then
	return
end

-- Configure nvim-autopairs
nvim_autopairs.setup({
	check_ts = true, -- Enable Tree-sitter integration for smarter pairing
	ts_config = {
		lua = { "string" }, -- Avoid pairs in Lua string nodes
		javascript = { "template_string" }, -- Avoid pairs in JavaScript template strings
		java = false, -- Disable Tree-sitter integration for Java
	},
	disable_filetype = { "TelescopePrompt", "vim" }, -- Disable in Telescope prompt and vim files
	fast_wrap = {}, -- Optional: Configure fast wrap mappings
})

-- Integration with nvim-cmp for auto-completion
local status_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not status_cmp_autopairs then
	return
end

-- Import nvim-cmp safely
local status_cmp, cmp = pcall(require, "cmp")
if not status_cmp then
	return
end

-- Assuming nvim-autopairs has been successfully required as nvim_autopairs

-- Correct integration with nvim-cmp
local status_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not status_cmp_autopairs then
	return
end

-- Assuming nvim-cmp has been successfully required as cmp

-- Setup nvim-cmp to work with nvim-autopairs
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done({
		map_char = { tex = "" }, -- Example customization, you can remove or adjust
	})
)
