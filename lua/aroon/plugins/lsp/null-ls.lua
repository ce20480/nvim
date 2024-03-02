-- -- import null-ls plugin safely
-- local setup, null_ls = pcall(require, "null-ls")
-- if not setup then
-- 	return
-- end
--
-- -- for conciseness
-- local formatting = null_ls.builtins.formatting -- to setup formatters
-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters
--
-- -- to setup format on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- -- configure null_ls
-- null_ls.setup({
-- 	-- setup formatters & linters
-- 	sources = {
-- 		--  to disable file types use
-- 		--  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
-- 		formatting.prettier, -- js/ts formatter
-- 		formatting.stylua, -- lua formatter
-- 		formatting.black, -- python formatter
-- 		diagnostics.eslint_d.with({ -- js/ts linter
-- 			-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
-- 			condition = function(utils)
-- 				return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
-- 			end,
-- 		}),
-- 		-- diagnostics.mypy, -- python linter
-- 	},
-- 	-- configure format on save
-- 	on_attach = function(current_client, bufnr)
-- 		if current_client.supports_method("textDocument/formatting") then
-- 			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
-- 			vim.api.nvim_create_autocmd("BufWritePre", {
-- 				group = augroup,
-- 				buffer = bufnr,
-- 				callback = function()
-- 					vim.lsp.buf.format({
-- 						filter = function(client)
-- 							--  only use null-ls for formatting instead of lsp server
-- 							return client.name == "null-ls"
-- 						end,
-- 						bufnr = bufnr,
-- 					})
-- 				end,
-- 			})
-- 		end
-- 	end,
-- })

-- Improvements:
-- Flexibility with Configuration Files: The eslint_d diagnostic source now checks for multiple common ESLint configuration file types, making your setup more adaptable to different projects.
--
-- Optional Arguments for Formatters: The black formatter includes an example of using extra_args to pass additional command-line arguments (in this case, --fast). This demonstrates how to customize the behavior of formatters further.
--
-- Clear and Concise Comments: Added and updated comments for clarity, making it easier for you or others to understand and modify the configuration in the future.
--
-- Modularity and Scalability: This configuration structure makes it easy to add or remove sources by simply including them in the sources table. It's designed for scalability, allowing you to seamlessly integrate more tools as your development needs evolve.
--
-- Checking for Multiple Configuration Files: For tools like eslint_d, checking for multiple types of configuration files increases the robustness of your setup, accommodating various project setups.
--
-- Future-Proofing: While the provided configuration covers many common use cases, always refer to the latest null-ls documentation for new features or changes. This ensures that your setup remains efficient and utilizes the full capabilities of the plugin.
-- Import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- Shorthand references for conciseness
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Setup format on save feature
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier, -- JavaScript/TypeScript formatter
		formatting.stylua, -- Lua formatter
		formatting.black.with({ extra_args = { "--fast" } }), -- Python formatter, with optional args
		diagnostics.eslint_d.with({ -- JavaScript/TypeScript linter
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json" }) -- Supports multiple config types
			end,
		}),
		-- Additional linters/formatters can be configured here
	},
	-- Format on save functionality
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							-- Only use null-ls for formatting to avoid conflicts
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
