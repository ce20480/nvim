-- set colorscheme to nightfly with protected call
-- in case it isn't installed
-- OLD!!!
-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not status then
  -- print("Colorscheme not found!") -- print error if colorscheme not installed
  -- return
-- end
-- END OF OLD!!!

-- Attempt to set the preferred colorscheme with protected call
local status, err = pcall(vim.cmd, "colorscheme nightfly")

if not status then
  -- Fallback to a default colorscheme if the preferred one isn't found
  vim.cmd("colorscheme desert") -- 'desert' is just an example; replace with any default Neovim colorscheme
  -- Notify the user about the fallback action
  vim.api.nvim_echo({{"Failed to load 'nightfly' colorscheme: " .. err, "ErrorMsg"}, {" Using default 'desert' colorscheme.", "Normal"}}, true, {})
else
  -- Set colorscheme-specific options here
  -- Place for colorscheme-specific configurations
  -- For example, enabling italic comments in 'nightfly' if it supports it
  -- vim.g.nightflyItalics = true

  -- Notify user of successful load (optional, can be removed if you prefer a cleaner startup)
  -- vim.api.nvim_echo({{"Loaded 'nightfly' colorscheme successfully.", "Normal"}}, true, {})
end
