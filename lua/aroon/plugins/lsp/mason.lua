-- -- import mason plugin safely
-- local mason_status, mason = pcall(require, "mason")
-- if not mason_status then
-- 	return
-- end
--
-- -- import mason-lspconfig plugin safely
-- local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
-- if not mason_lspconfig_status then
-- 	return
-- end
--
-- -- import mason-null-ls plugin safely
-- local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
-- if not mason_null_ls_status then
-- 	return
-- end
--
-- -- enable mason
-- mason.setup()
--
-- mason_lspconfig.setup({
-- 	-- list of servers for mason to install
-- 	ensure_installed = {
-- 		"tsserver",
-- 		"html",
-- 		"cssls",
-- 		"tailwindcss",
-- 		"lua_ls",
-- 		"emmet_ls",
-- 		"pyright",
-- 		"rust_analyzer",
-- 	},
-- 	-- auto-install configured servers (with lspconfig)
-- 	automatic_installation = true, -- not the same as ensure_installed
-- })
--
-- mason_null_ls.setup({
-- 	-- list of formatters & linters for mason to install
-- 	ensure_installed = {
-- 		"prettier", -- ts/js formatter
-- 		"stylua", -- lua formatter
-- 		"eslint_d", -- ts/js linter
-- 		"black", -- python linter
-- 	},
-- 	-- auto-install configured formatters & linters (with null-ls)
-- 	automatic_installation = true,
-- })
-- OLD!!!

-- Safe import of required plugins
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- Mason setup with custom configuration
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		-- Further UI customization options as per mason documentation
	},
})

-- Mason-lspconfig setup
mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"pyright",
		"rust_analyzer",
		-- Consider adding or removing servers based on your projects
	},
	automatic_installation = true, -- Auto-install above servers
	-- Additional configuration options here if needed
})

-- Mason-null-ls setup for formatters and linters
mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
		"black",
		-- Add or remove tools based on your usage
	},
	automatic_installation = true,
	-- Additional configuration options here if needed
})

-- Optional: Customize key mappings or commands that trigger lsp functionalities
-- Consider integrating these within your LSP `on_attach` function
