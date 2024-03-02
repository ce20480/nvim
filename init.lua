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

require("aroon.plugins-setup")
require("aroon.core.options")
require("aroon.core.keymaps")
require("aroon.core.colorscheme")
require("aroon.plugins.comment")
require("aroon.plugins.nvim-tree")
require("aroon.plugins.lualine")
require("aroon.plugins.telescope")
require("aroon.plugins.nvim-cmp")
require("aroon.plugins.lsp.mason")
require("aroon.plugins.lsp.lspsaga")
require("aroon.plugins.lsp.lspconfig")
require("aroon.plugins.lsp.null-ls")
require("aroon.plugins.autopairs")
require("aroon.plugins.treesitter")
require("aroon.plugins.gitsigns")
