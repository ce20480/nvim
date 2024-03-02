-- -- import nvim-cmp plugin safely
-- local cmp_status, cmp = pcall(require, "cmp")
-- if not cmp_status then
--   return
-- end
--
-- -- import luasnip plugin safely
-- local luasnip_status, luasnip = pcall(require, "luasnip")
-- if not luasnip_status then
--   return
-- end
--
-- -- import lspkind plugin safely
-- local lspkind_status, lspkind = pcall(require, "lspkind")
-- if not lspkind_status then
--   return
-- end
--
-- -- load vs-code like snippets from plugins (e.g. friendly-snippets)
-- require("luasnip/loaders/from_vscode").lazy_load()
--
-- vim.opt.completeopt = "menu,menuone,noselect"
--
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--     ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
--     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--     ["<C-e>"] = cmp.mapping.abort(), -- close completion window
--     ["<CR>"] = cmp.mapping.confirm({ select = false }),
--   }),
--   -- sources for autocompletion
--   sources = cmp.config.sources({
--     { name = "nvim_lsp" }, -- lsp
--     { name = "luasnip" }, -- snippets
--     { name = "buffer" }, -- text within current buffer
--     { name = "path" }, -- file system paths
--   }),
--   -- configure lspkind for vs-code like icons
--   formatting = {
--     format = lspkind.cmp_format({
--       maxwidth = 50,
--       ellipsis_char = "...",
--     }),
--   },
-- })
-- OLD!!!

-- Enhancements:
-- Tab Completion: Integrates tab completion for navigating through the completion menu and expanding snippets. This closely mirrors the IDE-like experience many developers are accustomed to.
-- Buffer Source Customization: Adjusts the keyword_length for buffer completions, helping to reduce noise by only suggesting words of a certain length.
-- Experimental Features: Enables ghost_text, which displays a preview of the selected completion item directly in the buffer, enhancing the visibility of what will be inserted.
-- Command-line Completion: Adds setup for command-line (:) completion, making navigating command history and commands more efficient.
-- Custom Formatting Callback: Provides a placeholder for custom formatting, allowing further customization of how completion items are displayed.
-- Import nvim-cmp, luasnip, and lspkind plugins safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- Load VSCode-like snippets from plugins like friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()

-- Set recommended 'completeopt' settings for best experience
vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- Required for 'luasnip' snippets
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `true` to select the first item if none is selected.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 4 }, -- Only show buffer completions for words of at least 4 characters
		{ name = "path" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			with_text = true, -- Show the text beside the icon
			maxwidth = 50, -- Prevent the popup from showing too much information
			before = function(entry, vim_item)
				-- Custom formatting can go here
				return vim_item
			end,
		}),
	},
	experimental = {
		ghost_text = true, -- Shows a preview of the currently selected completion item
	},
})

-- Setup cmdline completion
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "cmdline" },
	}),
})

-- Additional configurations like 'cmp.setup.cmdline' for '/' (search) can also be added
cmp.setup.cmdline("/", {
	sources = cmp.config.sources({
		{ name = "cmdline" },
	}),
})
