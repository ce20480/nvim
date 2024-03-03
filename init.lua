-- This is for pack/ folder, which have pulled plugins from github:

-- Manually managing plugins, like your copilot.vim repository in the pack folder, requires a balance between staying up-to-date and ensuring stability in your workflow. Here are some guidelines on how often you should update such plugins:

-- Critical Updates and Features
-- Immediately for critical security updates or fixes. Keep an eye on the plugin's GitHub repository or communication channels for any such announcements.
-- As needed for new features or improvements that are important to your workflow. If a new version includes enhancements you've been waiting for, don't hesitate to update.
-- Regular Maintenance
-- Weekly to Monthly: For regular maintenance, pulling updates on a weekly or monthly basis strikes a good balance. This frequency keeps your setup relatively up-to-date without the constant need for adjustments or the risk of introducing instability with each update.
-- Stability Over Frequency
-- If your workflow is heavily dependent on a plugin and requires stability, consider updating less frequently and only after verifying that the new version is stable and doesn't introduce breaking changes. Checking the plugin's changelog and issues in the GitHub repository can provide insights into the impact of an update.
-- Automating Updates
-- While manual updates give you control, they can be tedious. Consider automating the update process:

-- Scripting: Create a simple shell script that navigates to the plugin's directory and runs git pull to fetch the latest updates. Automate this script with cron jobs (on Linux/macOS) or Task Scheduler (on Windows) to run at your desired frequency.
-- Neovim Automation: Some Neovim configurations or plugins can help automate the process of updating manually cloned plugins. However, since copilot.vim is a special case, sticking to manual updates or a simple external script might be more straightforward.
-- Monitoring Changes
-- Before updating, especially for critical parts of your workflow like copilot.vim, glance at the changelog or commit history in the GitHub repository to understand what changes the update will bring. This can help avoid surprises, especially with breaking changes or new features that might alter your workflow.

-- Conclusion
-- For a plugin like copilot.vim, starting with monthly updates is a reasonable approach, adjusting based on your needs, the pace of development of the plugin, and how critical it is to your daily tasks. Always back up your current configuration before updating, so you can easily revert if an update causes issues.
-- require("aroon.plugins-setup")
-- require("aroon.core.options")
-- require("aroon.core.keymaps")
-- require("aroon.core.colorscheme")
-- require("aroon.plugins.comment")
-- require("aroon.plugins.nvim-tree")
-- require("aroon.plugins.lualine")
-- require("aroon.plugins.telescope")
-- require("aroon.plugins.nvim-cmp")
-- require("aroon.plugins.lsp.mason")
-- require("aroon.plugins.lsp.lspsaga")
-- require("aroon.plugins.lsp.lspconfig")
-- require("aroon.plugins.lsp.null-ls")
-- require("aroon.plugins.autopairs")
-- require("aroon.plugins.treesitter")
-- require("aroon.plugins.gitsigns")
-- OLD!!!

-- Enhacnements:
-- 1. Safe require
local safe_require = function(path)
	local status, module = pcall(require, path)
	if not status then
		vim.notify("Failed to load " .. path, vim.log.levels.WARN)
	end
	return module
end

safe_require("aroon.plugins-setup")
safe_require("aroon.plugins-setup")
safe_require("aroon.core.options")
safe_require("aroon.core.keymaps")
safe_require("aroon.core.colorscheme")
safe_require("aroon.plugins.comment")
safe_require("aroon.plugins.nvim-tree")
safe_require("aroon.plugins.lualine")
safe_require("aroon.plugins.telescope")
safe_require("aroon.plugins.which-key")
safe_require("aroon.plugins.nvim-cmp")
safe_require("aroon.plugins.lsp.mason")
safe_require("aroon.plugins.lsp.lspsaga")
safe_require("aroon.plugins.lsp.lspconfig")
safe_require("aroon.plugins.lsp.null-ls")
safe_require("aroon.plugins.autopairs")
safe_require("aroon.plugins.treesitter")
safe_require("aroon.plugins.gitsigns")

-- Improvements to be made:
-- Dynamic Loading for Performance: For configurations that are not always needed, consider using lazy-loading techniques to improve startup time. Packer supports lazy-loading plugins based on commands, file types, or events. While this approach is more about plugin loading than configuration, structuring your init.lua to take advantage of lazy loading can further optimize performance.
-- Documenting Your Configuration: Comments can greatly improve the maintainability of your configuration, especially if you or someone else comes back to it after some time. Consider adding comments to your init.lua and other configuration files to explain the purpose of each section or important settings.
-- Consolidation of LSP Configurations: Your LSP-related configurations (mason, lspsaga, lspconfig, null-ls) are separated into different files, which is great for organization. However, if these configurations share common setups or could be streamlined, consider creating a unified LSP configuration file that handles the setup for all LSP-related functionality cohesively.
-- Version Control: If not already done, consider version-controlling your Neovim configuration using Git. This allows you to track changes, revert to previous states if an issue arises, and share your configuration easily with others or across machines.
