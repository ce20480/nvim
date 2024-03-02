-- -- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")
-- -- new colors for theme
-- local new_colors = {
--   blue = "#65D1FF",
--   green = "#3EFFDC",
--   violet = "#FF61EF",
--   yellow = "#FFDA7B",
--   black = "#000000",
-- }
--
-- -- change nightlfy theme colors
-- lualine_nightfly.normal.a.bg = new_colors.blue
-- lualine_nightfly.insert.a.bg = new_colors.green
-- lualine_nightfly.visual.a.bg = new_colors.violet
-- lualine_nightfly.command = {
--   a = {
--     gui = "bold",
--     bg = new_colors.yellow,
--     fg = new_colors.black, -- black
--   },
-- }
--
-- -- configure lualine with modified theme
-- lualine.setup({
--   options = {
--     theme = lualine_nightfly,
--   },
-- })

-- Enhancement:
-- Component and Section Separators: Customizing separators can enhance the visual distinction between different sections of your status line.
-- Sections Customization: The configuration of sections and inactive_sections allows you to control what information is displayed in the active and inactive status lines, respectively. This setup shows the mode, branch, diff, diagnostics in active windows, and simplifies the display for inactive windows.
-- Extensions Integration: lualine supports extensions to integrate with other plugins like fugitive (for Git), nvim-tree (a file explorer), and others. Including these extensions can make relevant information available directly in your status line, enhancing its utility.

-- New colors for theme
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- Change nightfly theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
-- lualine_nightfly.command.a.bg = new_colors.yellow -- Ensure this matches the structure of lualine_nightfly
-- lualine_nightfly.command.a.fg = new_colors.black
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}
-- Configure lualine with modified theme and additional features
lualine.setup({
	options = {
		theme = lualine_nightfly,
		component_separators = { left = "", right = "" }, -- Optional: Customize separators
		section_separators = { left = "", right = "" }, -- Optional: Customize section separators
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		-- Customize or hide sections for inactive windows
		lualine_c = { "filename" },
		lualine_x = { "location" },
	},
	extensions = { "fugitive", "quickfix", "nvim-tree" }, -- Optional: Integrate with other plugins
})
