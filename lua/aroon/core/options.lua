-- local opt = vim.opt -- for conciseness
--
-- -- line numbers
-- opt.relativenumber = true -- show relative line numbers
-- opt.number = true -- shows absolute line number on cursor line (when relative number is on)
--
-- -- tabs & indentation
-- opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
-- opt.shiftwidth = 2 -- 2 spaces for indent width
-- opt.expandtab = true -- expand tab to spaces
-- opt.autoindent = true -- copy indent from current line when starting new one
--
-- -- line wrapping
-- opt.wrap = false -- disable line wrapping
--
-- -- search settings
-- opt.ignorecase = true -- ignore case when searching
-- opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
--
-- -- cursor line
-- opt.cursorline = true -- highlight the current cursor line
--
-- -- appearance
--
-- -- turn on termguicolors for nightfly colorscheme to work
-- -- (have to use iterm2 or any other true color terminal)
-- opt.termguicolors = true
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark
-- opt.signcolumn = "yes" -- show sign column so that text doesn't shift
--
-- -- backspace
-- opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
--
-- -- clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register
--
-- -- split windows
-- opt.splitright = true -- split vertical window to the right
-- opt.splitbelow = true -- split horizontal window to the bottom
--
-- opt.iskeyword:append("-") -- consider string-string as whole word
-- OLD!!!

local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Disabling line wrapping for better readability
opt.wrap = false

-- Search settings: case sensitivity
opt.ignorecase = true
opt.smartcase = true

-- Highlight the current line for visibility
opt.cursorline = true

-- Appearance: Enable true color support and set dark background
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Enhance backspace behavior
opt.backspace = "indent,eol,start"

-- Use system clipboard
opt.clipboard:append("unnamedplus")

-- Window splitting preferences
opt.splitright = true
opt.splitbelow = true

-- Treat hyphen-separated words as a whole
opt.iskeyword:append("-")

-- Persistent undo and mouse support (consider adding based on preference)
-- 1. opt.undofile = true
-- Purpose: Enables persistent undo in Neovim.
-- Effect: With this setting enabled, Neovim will save your undo history to a file when you close a buffer or exit Neovim. This allows you to undo changes even after closing and reopening files, as long as the undo file exists.
-- Usage Scenario: This is particularly useful for long-term projects or when making significant changes to files. If you close a file or Neovim accidentally, you won't lose your undo history.
-- 2. opt.mouse = "a"
-- Purpose: Enables mouse support in all modes.
-- Effect: With this setting enabled, you can use the mouse to scroll, resize windows, and select text in all modes, including normal mode. This can be useful if you're used to using the mouse for these actions or if you're working on a touchpad.
-- Usage Scenario: This setting is particularly useful if you're new to Neovim or if you're working on a laptop with a touchpad.
opt.undofile = true -- Enable persistent undo
opt.mouse = "a" -- Enable mouse in all modes

-- Completion menu behavior
-- 1. opt.completeopt = "menu,menuone,noselect"
-- Purpose: Enhances the behavior of the completion menu.
-- Effect: With this setting enabled, the completion menu will appear as soon as you start typing, and you can use the arrow keys to navigate through the menu. You can also use the tab key to select the first item in the menu, and the enter key to confirm your selection.
-- Usage Scenario: This setting is particularly useful if you want to see the completion menu as soon as you start typing, and if you want to use the arrow keys to navigate through the menu.
opt.completeopt = "menu,menuone,noselect"
