-- -- import lspconfig plugin safely
-- local lspconfig_status, lspconfig = pcall(require, "lspconfig")
-- if not lspconfig_status then
-- 	return
-- end
--
-- -- import cmp-nvim-lsp plugin safely
-- local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not cmp_nvim_lsp_status then
-- 	return
-- end
--
-- -- import typescript plugin safely
-- local typescript_setup, typescript = pcall(require, "typescript")
-- if not typescript_setup then
-- 	return
-- end
--
-- local keymap = vim.keymap -- for conciseness
--
-- -- enable keybinds only for when lsp server available
-- local on_attach = function(client, bufnr)
-- 	-- keybind options
-- 	local opts = { noremap = true, silent = true, buffer = bufnr }
--
-- 	-- set keybinds
-- 	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
-- 	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
-- 	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
-- 	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
-- 	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
-- 	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
-- 	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
-- 	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
-- 	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
-- 	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
-- 	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
-- 	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
--
-- 	-- typescript specific keymaps (e.g. rename file and update imports)
-- 	if client.name == "tsserver" then
-- 		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
-- 		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
-- 		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
-- 	end
-- end
--
-- -- used to enable autocompletion (assign to every lsp server config)
-- local capabilities = cmp_nvim_lsp.default_capabilities()
--
-- -- Change the Diagnostic symbols in the sign column (gutter)
-- -- (not in youtube nvim video)
-- local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end
--
-- -- configure html server
-- lspconfig["html"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- -- configure typescript server with plugin
-- typescript.setup({
-- 	server = {
-- 		capabilities = capabilities,
-- 		on_attach = on_attach,
-- 	},
-- })
--
-- -- configure css server
-- lspconfig["cssls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- -- configure python server
-- lspconfig["pyright"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- -- configure rust server
-- lspconfig["rust_analyzer"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- -- configure tailwindcss server
-- lspconfig["tailwindcss"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- -- configure emmet language server
-- lspconfig["emmet_ls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
-- })
--
-- -- configure lua server (with special settings)
-- lspconfig["lua_ls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	settings = { -- custom settings for lua
-- 		Lua = {
-- 			-- make the language server recognize "vim" global
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- make language server aware of runtime files
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- })

-- Safe loading of required plugins
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
	return
end

local typescript_ok, typescript = pcall(require, "typescript")
if not typescript_ok then
	return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Function to add LSP keymaps
local function on_attach(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	-- TypeScript specific keymaps
	if client.name == "tsserver" then
		keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>", bufopts)
		keymap("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", bufopts)
		keymap("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", bufopts)
	end
end

-- Enhanced capabilities for autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Diagnostic signs customization
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Default server configuration
local function default_server_config()
	return {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- Server-specific configurations
local server_settings = {
	-- Configuration for Lua
	["lua_ls"] = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	},
	-- Enhanced configuration for Pyright
	-- typeCheckingMode: Setting this to "strict" provides the most comprehensive type checks.
	-- Adjust according to your preference and project requirements. "off" or "basic" might be suitable for less strict type checking.
	-- autoSearchPaths: When enabled, pyright automatically searches for and includes Python paths in your project, improving module resolution and imports.
	-- diagnosticMode: Set to "workspace" to enable diagnostics across your entire workspace, not just the open file. This gives a broader view of issues in your project.
	-- useLibraryCodeForTypes: Tells pyright to infer types from library implementations when type stubs aren't available, leading to better completions and hints.
	-- Python-specific on_attach: Allows you to define Python-specific key mappings or settings. This is useful if you have commands or features you only want enabled for Python development.
	-- Customize Further as Needed: Depending on your workflow, you might want to customize other settings under python.analysis. Refer to the Pyright documentation for more configuration options.
	["pyright"] = {
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "strict", -- Options: "off", "basic", "strict"
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
					-- Configure stubPath for better type information in completions (if necessary)
					-- stubPath = vim.fn.expand("~/.config/coc/extensions/coc-pyright-data/stubs"),
				},
			},
		},
		on_attach = function(client, bufnr)
			-- Custom on_attach function for Python
			-- This is where you can add Python-specific keymaps, for example:
			-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>PythonRun<CR>', { noremap = true, silent = true })
			on_attach(client, bufnr) -- Call the global on_attach to set general LSP keymaps
		end,
	},
}

-- Setup servers with both default and server-specific configurations
for server, config in pairs(server_settings) do
	lspconfig[server].setup(vim.tbl_deep_extend("force", default_server_config(), config))
end

-- Servers with default configurations only
local servers = { "html", "cssls", "pyright", "rust_analyzer", "tailwindcss", "emmet_ls" }
for _, server in ipairs(servers) do
	lspconfig[server].setup(default_server_config())
end

-- TypeScript server setup with typescript plugin
typescript.setup({
	server = vim.tbl_deep_extend("force", default_server_config(), {}),
})
